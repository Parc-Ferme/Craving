//
//  RestraurantListView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

struct RestraurantListView: View {
    
    var restraurantImage: String?
    
    var body: some View {
        
        NavigationLink(destination: RestraurantDetailView()) {
            
            ZStack (alignment: .leading) {
                
                HStack (spacing: 18){
                    
                    Image(restraurantImage!)
                        .resizable()
                        .frame(width: 140, height: 170)
                        .cornerRadius(15)
                        .shadow(radius: 23)
                        .padding(.vertical,5)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack (spacing: 4){
                            
                            Image(systemName: "trophy.circle.fill")
                                .foregroundColor(.gold)
                            
                            Text("Best In North Indian")
                                .font(.montserrat(.semiBold, size: 15))
                                .foregroundColor(.primary.opacity(0.6))
                        }
                        
                        Text("Punjabi Angithi (Vegora...)")
                            .font(.montserrat(.extraBold, size: 19))
                            .lineLimit(1)
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 3) {
                            
                            Image(systemName: "star.circle.fill")
                                .foregroundColor(.darkGreen)
                            
                            Text("4.3 (40K+)")
                                .font(.custom("Monteserrat-Regular", size: 14))
                                .foregroundStyle(Color.darkGreen)
                            
                            Circle()
                                .frame(width: 4, height: 4)
                                .foregroundStyle(Color.primary.opacity(0.5))
                            
                            Text("35-40 mins")
                                .font(.custom("Monteserrat-Bold", size: 15))
                                .foregroundColor(.darkPurple)
                            
                            Image(systemName: "bolt.fill")
                                .resizable()
                                .frame(width: 10, height: 13)
                                .foregroundColor(.darkPurple)
                        }
                        
                        Text("North Indian, Chinese, Tandoor") // Cuisine types
                            .font(.montserrat(.regular, size: 13))
                            .foregroundColor(.primary.opacity(0.65))
                        
                        Text("Dwarka 2 • 4.5 km") // Address and distance
                            .font(.montserrat(.regular, size: 13))
                            .foregroundColor(.primary.opacity(0.65))
                        
                        HStack (spacing: 4){
                            Capsule()
                                .fill(Color.black)
                                .frame(width: 38, height: 18)
                                .padding(.leading, 4)
                                .padding(.vertical, 4)
                            Text("Free Delivery + 10% Off")
                                .font(.montserrat(.extraBold, size: 13))
                                .foregroundColor(.darkPurple)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.pink.opacity(0.1))
                        .clipShape(.capsule)
                    }
                    //.frame(width: 210, height: 142)
                }
                .frame(width: 370, alignment: .leading)
                
                //Discount Label over image
            }
        }
        
    }
}

#Preview {
    RestraurantListView(restraurantImage: "biryaani by kilo")
}
