import SwiftUI
import Combine

class RestaurantViewModel: ObservableObject {
    
    // Published property to notify the view of data changes
    @Published var restaurants: [Restaurant] = []
    @Published var searchText: String = "" // For searching
    
    enum Options: String {
        case rating = "Rating"
        case distance = "Distance"
        case deliveryTime = "DeliveryTime"
    }

    
    func loadRestaurants () {
        
        restaurants = RestaurantsArray
    }
    
    func SearchRestaurant(_ text: String) {
        
        if !searchText.isEmpty {
            restaurants = restaurants.filter { restaurant in
                restaurant.name.lowercased().contains(searchText.lowercased()) ||
                restaurant.speciality.lowercased().contains(searchText.lowercased()) ||
                restaurant.cuisine.contains { $0.lowercased().contains(searchText.lowercased()) }
            }
        } else {
            loadRestaurants()
        }
    }
    
    func bestsellerRestaurants(_ text: String?) {
        
        if let _ = text {
            restaurants = restaurants.filter { $0.speciality == "Bestseller" }
        } else {
            loadRestaurants()
        }
        
    }
    
    func setRatingFilter(rating: Double?) {
        
        if let minRating = rating {
            restaurants = restaurants.filter { $0.rating >= minRating }
        } else {
            loadRestaurants()
        }
    }

    func sortRestaurants(sortBy: String?) {
        
        if let name = sortBy {
            
            guard let sortOption = Options(rawValue: name) else {
                print("Invalid sort option")
                return
            }
            
            switch sortOption {
            case .rating:
                restaurants.sort { $0.rating > $1.rating }
            case .distance:
                restaurants.sort { $0.distance < $1.distance }
            case .deliveryTime:
                restaurants.sort { $0.deliveryTime < $1.deliveryTime }
            }
        } else {
            loadRestaurants()
        }
    }
}
