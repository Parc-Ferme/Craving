import SwiftUI

struct FoodCuisineView: View {
    
    let cuisinesImage = ["bbq", "kfc", "cakes", "burger", "tea", "pizza", "paratha", "paneer", "pakoda", "mcdonalds"]
    
    let EfoodCategories = [
        "Desserts", "Snacks", "Pastries", "Fries", "Breads",
        "Cheeses", "Soups", "Stews", "Cured Meats", "Seafood", "Savory Pies", "Cakes", "Cookies", "Chocolates", "Sandwiches", "Salads", "Pasta Dishes", "Rice Dishes", "Crepes", "Tarts"
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
                HStack {
                    
                    Text("CRAVINGS FOR ALL YOUR MOODS")
                        .font(.montserrat(.bold, size: 13))
                        .padding(.leading, 16)
                        .foregroundStyle(Color.black.opacity(0.8))
                        .lineLimit(1)
                    
                    
                    FadingLineView()
                        .frame(width: 150)
                        .padding(.bottom, 4)
                }
                
                TileScrollView(EfoodCategories: EfoodCategories, cuisinesImage: cuisinesImage, tiles: 2)
                    
        }
    }
}

#Preview {
    FoodCuisineView()
}
