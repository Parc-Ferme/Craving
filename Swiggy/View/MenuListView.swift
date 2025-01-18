import SwiftUI

struct MenuListView: View {
    
    var body: some View {
        
        VStack {
            
            ForEach(0..<15) { index in
                
                let appetizers = menuItems[index]
                
                ZStack (alignment: .leading) {
                    
                    HStack (spacing: 18){
                        
                        VStack(alignment: .leading, spacing:9) {
                            
                            HStack (spacing: 4){
                                
                                Image(systemName: "dot.square")
                                    .foregroundColor(appetizers.veg ? .darkGreen : .red)
                                
                                Text(appetizers.veg ? "Veg" : "Non Veg")
                                    .font(.montserrat(.semiBold, size: 15))
                                    .foregroundColor(.black.opacity(0.6))
                            }
                            
                            Text(appetizers.name)
                                .font(.montserrat(.extraBold, size: 19))
                                .lineLimit(1)
                                .foregroundColor(.black)
                            
                            Text("￡\(appetizers.price.truncated(to: 2))")
                                .font(.montserrat(.regular, size: 13))
                                .foregroundColor(.black.opacity(0.65))
                            
                            HStack {
                                Text("\(appetizers.description)")
                                    .font(.montserrat(.regular, size: 13))
                                    .foregroundColor(.black.opacity(0.65))
                            }
                        }
                        
                        Spacer()
                        
                        ImageView(imageURL: appetizers.image)
                    }
                    .frame(width: 370, height: 200, alignment: .leading)
                }
                
                FadingLineView(color: .swiggy, height: 2)
                    .padding(.trailing, 150)
                    .padding(.leading, 20)
            }
        }
    }
}

#Preview {

    MenuListView ()
}
