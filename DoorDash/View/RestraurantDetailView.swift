import SwiftUI

struct RestaurantDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var frames: [CGRect] = []
    
    @State var isTitleVisible: Bool = false
    
    var coordinateName = "RestaurantDetails"
    var restaurant: Restaurant
    var namespace: Namespace.ID
    
    var body: some View {
        
        NavigationStack() {
            
            ScrollView {
                
                ZStack {
                    
                    StretchableImageView(isTitleVisible: $isTitleVisible, imageName: restaurant.image)
                        .scrollTransition {
                            content, phase in
                            content
                                .blur(radius: phase.isIdentity ? 0 : 10)
                        }
                        //.matchedGeometryEffect(id: restaurant.name, in: namespace)
                        .animation(.easeInOut(duration: 0.5), value: 1)
                    
                }
                
                VStack() {
                    
                    RestaurantDetailTile(restaurant: restaurant)
                    
                    MenuListView()
                }
                
            }
            .edgesIgnoringSafeArea(.top)
            .coordinateSpace(name: coordinateName)
            .onPreferenceChange(FramePreferenceKey.self, perform: {
                frames = $0.sorted { $0.minY < $1.minY }
            })
            .navigationTitle(isTitleVisible ? restaurant.name : "")
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.white, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButtonView(action: dismiss)
                }
            }
            
        }
        
    }
}

#Preview {
    
    @Previewable @Namespace var namespace
    
    RestaurantDetailView(restaurant: RestaurantsArray[8], namespace: namespace)
}
