import SwiftUI

struct TileScrollView: View {
    
    let EfoodCategories: [String]
    let cuisinesImage: [String]
    
    var tiles: Int = 1
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            VStack {
                
                ForEach(0..<tiles, id: \.self) { index in
                    
                    LazyHStack (spacing: 2) {
                        
                        ForEach(0..<10,  id: \.self) { index in
                            
                            NavigationLink(destination: AccountView()) {
                                
                                VStack {
                                    
                                    Image(cuisinesImage[index])
                                        .resizable()
                                        .clipShape(.circle)
                                        .frame(width: 70, height: 70)
                                        .scaledToFit()
                                        .padding(.horizontal, 10)
                                        .tag(index)
                                    
                                    
                                    Text(EfoodCategories[index])
                                        .font(.montserrat(.regular, size: 13))
                                        .frame(width: 65, height: 5)
                                        .foregroundStyle(Color.primary.opacity(0.4))
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                }
                
            }
            .padding(.vertical, 10)
            .padding(.leading, 6)
            
        }
        
    }
}

#Preview {
    
    let cuisinesImage = ["bbq", "kfc", "cakes", "burger", "tea", "pizza", "paratha", "paneer", "pakoda", "mcdonalds"]
    
    let EfoodCategories = [
        "Desserts", "Snacks", "Pastries", "Fries", "Breads",
        "Cheeses", "Soups", "Stews", "Cured Meats", "Seafood"
    ]
    
    TileScrollView(EfoodCategories: EfoodCategories, cuisinesImage: cuisinesImage)
}
