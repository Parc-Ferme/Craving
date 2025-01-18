import SwiftUI

struct StickyFilterView: View {

    @State var isTapped: Bool = false
    
    @ObservedObject var viewModel: RestaurantViewModel
    
    var body: some View {
        
        ZStack {
            
            ScrollView (.horizontal, showsIndicators: false) {
                
                HStack (spacing: 12){
                    
                    DynamicCapsuleButton(text: "Sort By ⭐️",
                                         value: "Ratings",
                                         action: viewModel.sortRestaurants)
                    
                    DynamicCapsuleButton(text: "Sort By 🚴🏻‍♂️",
                                         value: "Distance",
                                         action: viewModel.sortRestaurants)
                    
                    DynamicCapsuleButton(text: "Sort By ⏳",
                                         value: "DeliveryTime",
                                         action: viewModel.sortRestaurants)
                    
                    DynamicCapsuleButton(text: "Ratings 4.0 ➕",
                                         value: 4.0,
                                         action: viewModel.setRatingFilter)
                    
                    DynamicCapsuleButton(text: "Bestseller 🍥",
                                         value: "Bestseller",
                                         action: viewModel.bestsellerRestaurants)
                    
                }
                .ignoresSafeArea(edges: .leading)
                .ignoresSafeArea(edges: .trailing)
                .padding(.top, 10)
                .frame(height: 70)
                .background(.white)
            }
        }
        
    }
}

struct DynamicCapsuleButton<T>: View {
    
    @State var isTapped: Bool = false
    
    var text: String
    
    var systemImageName: String? = nil
    
    var value: T?
    
    var action: (T?) -> Void
    
    var body: some View {
        
        Button( action: {
            
            withAnimation {
                
                self.isTapped.toggle()
                
                if self.isTapped { action(value) }
                else { action(nil) }
            }
        }){
            
            HStack(spacing: 8) {
                
                Text(text)
                    .font(.montserrat(.bold, size: 15))
                
                if let systemImageName = systemImageName {
                    Image(systemName: systemImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                }
            }
            
            .padding(.horizontal, 13)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .fill(isTapped ? Color.doordash : Color.primary.opacity(0.06))
            )
            .foregroundColor(isTapped ? .white : Color.primary.opacity(0.6))
        }
    }
}


#Preview {
    
    StickyFilterView(viewModel: RestaurantViewModel())
}
