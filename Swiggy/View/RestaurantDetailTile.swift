import SwiftUI

struct RestaurantDetailTile: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text(restaurant.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            HStack(spacing: 6) {
                Image(systemName: "star.circle.fill")
                    .foregroundColor(Color.darkGreen)
                    .font(.subheadline)
                Text("\(restaurant.rating.truncated(to: 1)) • \(restaurant.viewCount.truncated(to: 1))K Reviews")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            VStack (alignment: .leading) {
                
                Text("\(restaurant.location)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("\(restaurant.deliveryTime - 5) - \(restaurant.deliveryTime + 5) mins")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            
            FadingLineView(color: .swiggy, height: 1)
            
            VStack(alignment: .leading) {
                Text(restaurant.cuisine.joined(separator: ", "))
                    .fontWeight(.medium)
                Text("Free delivery above ￡20")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            FadingLineView(color: .swiggy, height: 1)
            
        }
        .padding()
        
    }
}

#Preview {
    
    RestaurantDetailTile(restaurant: RestaurantsArray[8])
}
