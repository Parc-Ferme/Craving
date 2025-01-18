import SwiftUI

struct DoorDashView: View {
    
    @StateObject private var restaurantViewModel = RestaurantViewModel()
    
    @State private var HeaderHeight: CGFloat = 0
    
    @State var isRedacted: Bool = false
   
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HeaderView(restaurantViewModel: restaurantViewModel, HeaderHeight: $HeaderHeight)
                
                ScrollView {
                    
                    LazyVStack (spacing: 10) {
                        
                        CircularImageScroll()
                        
                        FoodCuisineView()
                        
                        ZStack {
                            
                            RestaurantListView(restaurantViewModel: restaurantViewModel)
                                .padding(.top, 90)
                            
                            GeometryReader { geometry in
                                
                                StickyFilterView(viewModel: restaurantViewModel)
                                    .aspectRatio(contentMode: .fill)
                                    .offset(y: {
                                        let minY = geometry.frame(in: .global).origin.y
                                        if (minY < HeaderHeight) {
                                            return HeaderHeight - minY
                                        }
                                        else if (minY < 0) {
                                            return HeaderHeight + abs(minY)
                                        }
                                        else {
                                            return 0
                                        }
                                    }())
                            }
                        }
                    }
                }
                .scrollBounceBehavior(.always)
            }
            .scrollIndicators(.hidden)
        }
        .refreshable {
            await refrshdoordashView()
        }
    }
    
    func refrshdoordashView() async {
        restaurantViewModel.loadRestaurants()
    }
}

#Preview {
    DoorDashView()
}
