import SwiftUI

struct RestaurantListView: View {
    
    @Environment(\.redactionReasons) var redactedReasons
    
    @Namespace var namespace
    @ObservedObject var restaurantViewModel: RestaurantViewModel
    
    var body: some View {
        
        LazyVStack(spacing: 20) {
            
            let restaurants = restaurantViewModel.restaurants
            
            ForEach(restaurants, id: \.id) { restaurant in
                
                HStack {
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant, namespace: namespace)
                    ) {
                        
                        ZStack (alignment: .leading) {
                            
                            HStack (spacing: 18){
                                
                                ImageView(imageURL: restaurant.image)
            
                            }
                            
                            
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack (spacing: 4){
                            
                            Image(systemName: "trophy.circle.fill")
                                .foregroundColor(.gold)
                            
                            Text(restaurant.speciality)
                                .font(.montserrat(.semiBold, size: 15))
                                .foregroundColor(.black.opacity(0.6))
                        }
                        
                        Text(restaurant.name)
                            .font(.montserrat(.extraBold, size: 19))
                            .lineLimit(1)
                            .foregroundColor(.black)
                        
                        HStack(spacing: 3) {
                            
                            Image(systemName: "star.circle.fill")
                                .foregroundColor(.darkGreen)
                            
                            Text("\(restaurant.rating.truncated(to: 1)) (\(restaurant.viewCount.truncated(to: 1))K)")
                                .font(.custom("Monteserrat-Regular", size: 14))
                                .foregroundStyle(Color.darkGreen)
                            
                            Circle()
                                .frame(width: 4, height: 4)
                                .foregroundStyle(Color.black.opacity(0.5))
                            
                            Text("\(restaurant.deliveryTime - 5) - \(restaurant.deliveryTime + 5) mins")
                                .font(.custom("Monteserrat-Bold", size: 15))
                                .foregroundColor(.darkPurple)
                            
                            Image(systemName: "bolt.fill")
                                .resizable()
                                .frame(width: 10, height: 13)
                                .foregroundColor(.darkPurple)
                        }
                        
                        Text(restaurant.cuisine.joined(separator: ", ")) // Cuisine types
                            .font(.montserrat(.regular, size: 13))
                            .foregroundColor(.black.opacity(0.65))
                        
                        HStack {
                            Text("\(restaurant.location)")
                                .font(.montserrat(.regular, size: 13))
                                .foregroundColor(.black.opacity(0.65))
                                .lineLimit(1)
                            Text("• \(restaurant.distance.truncated(to: 1)) miles")
                                .font(.montserrat(.regular, size: 13))
                                .foregroundColor(.black.opacity(0.65))
                        }
                        
                        HStack (spacing: 4){
                            Capsule()
                                .fill(Color.black)
                                .frame(width: 38, height: 18)
                                .padding(.leading, 4)
                                .padding(.vertical, 4)
                            Text("Free Delivery above ￡20")
                                .font(.montserrat(.extraBold, size: 13))
                                .foregroundColor(.darkPurple)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.pink.opacity(0.1))
                        .clipShape(.capsule)
                    }
                }
                .frame(width: 370, alignment: .leading)
            }
        }
        .onAppear {
            restaurantViewModel.loadRestaurants()
        }
    }
}

#Preview {
    
    @Previewable @ObservedObject var restaurantViewModel: RestaurantViewModel = RestaurantViewModel()
    
    RestaurantListView(restaurantViewModel: restaurantViewModel)
}
