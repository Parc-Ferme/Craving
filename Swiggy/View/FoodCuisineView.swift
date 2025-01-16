//
//  FoodCuisineView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 17/01/25.
//

import SwiftUI

struct FoodCuisineView: View {
    
    let cuisinesImage = ["bbq", "kfc", "cakes", "burger", "tea", "pizza", "paratha", "paneer", "pakoda", "mcdonalds"]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
                HStack {
                    
                    Text("CRAVINGS FOR ALL YOUR MOODS")
                        .font(.montserrat(.bold, size: 13))
                        .padding(.leading, 16)
                        .foregroundStyle(Color.primary.opacity(0.8))
                        .lineLimit(1)
                    
                    
                    FadingLineView()
                        .frame(width: 150)
                        .padding(.bottom, 4)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    VStack {
                        
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
                                        
                                        
                                        Text("Favorite")
                                            .font(.montserrat(.regular, size: 13))
                                            .frame(width: 65, height: 5)
                                            .foregroundStyle(Color.primary.opacity(0.4))
                                            .lineLimit(1)
                                    }
                                }
                            }
                        }
                        
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
                                        
                                        Text("Favorite")
                                            .font(.montserrat(.regular, size: 13))
                                            .frame(width: 65, height: 5)
                                            .foregroundStyle(Color.primary.opacity(0.4))
                                            .lineLimit(1)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding([.leading], 6)
                    
                }
        }
    }
}

#Preview {
    FoodCuisineView()
}
