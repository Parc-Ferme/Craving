//
//  AccountView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

struct AccountView: View {
    
    var body: some View {
        
        Text("Account View")
    }
}

#Preview {
    AccountView()
}


////
////  RestraurantListView.swift
////  Swiggy
////
////  Created by Ankit Yadav on 16/01/25.
////
//
//import SwiftUI
//import SwiftData
//
//struct RestraurantListView: View {
//    
//    var restraurant: Restraurant
//    
//    var body: some View {
//        
//        NavigationLink(destination: RestraurantDetailView()) {
//            
//            ZStack (alignment: .leading) {
//                
//                HStack (spacing: 18){
//                    
//                    Image(restraurant.image)
//                        .resizable()
//                        .frame(width: 140, height: 170)
//                        .cornerRadius(15)
//                        .shadow(radius: 2)
//                        .padding(.vertical,5)
//                    
//                    VStack(alignment: .leading, spacing: 4) {
//                        
//                        HStack (spacing: 4){
//                            
//                            Image(systemName: "trophy.circle.fill")
//                                .foregroundColor(.gold)
//                            
//                            Text(restraurant.speciality)
//                                .font(.montserrat(.semiBold, size: 15))
//                                .foregroundColor(.primary.opacity(0.6))
//                        }
//                        
//                        Text(restraurant.name)
//                            .font(.montserrat(.extraBold, size: 19))
//                            .lineLimit(1)
//                            .foregroundColor(.primary)
//                        
//                        HStack(spacing: 3) {
//                            
//                            Image(systemName: "star.circle.fill")
//                                .foregroundColor(.darkGreen)
//                            
//                            Text("\(restraurant.rating)" + "\(restraurant.viewCount/1000)" + "K")
//                                .font(.custom("Monteserrat-Regular", size: 14))
//                                .foregroundStyle(Color.darkGreen)
//                            
//                            Circle()
//                                .frame(width: 4, height: 4)
//                                .foregroundStyle(Color.primary.opacity(0.5))
//                            
//                            Text("\(restraurant.deliveryTime - 5) - \(restraurant.deliveryTime + 5) Mins")
//                                .font(.custom("Monteserrat-Bold", size: 15))
//                                .foregroundColor(.darkPurple)
//                            
//                            Image(systemName: "bolt.fill")
//                                .resizable()
//                                .frame(width: 10, height: 13)
//                                .foregroundColor(.darkPurple)
//                        }
//                        
//                        Text(restraurant.cuisine.joined(separator: ", "))
//                            .font(.montserrat(.regular, size: 13))
//                            .foregroundColor(.primary.opacity(0.65))
//                        
//                        Text("\(restraurant.location) • \(restraurant.distance * 0.62) miles")
//                            .font(.montserrat(.regular, size: 13))
//                            .foregroundColor(.primary.opacity(0.65))
//                        
//                        HStack (spacing: 4){
//                            Capsule()
//                                .fill(Color.black)
//                                .frame(width: 38, height: 18)
//                                .padding(.leading, 4)
//                                .padding(.vertical, 4)
//                            Text("Free Delivery above $10")
//                                .font(.montserrat(.extraBold, size: 13))
//                                .foregroundColor(.darkPurple)
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(.pink.opacity(0.1))
//                        .clipShape(.capsule)
//                    }
//                    //.frame(width: 210, height: 142)
//                }
//                .frame(width: 370, alignment: .leading)
//                
//                //Discount Label over image
//            }
//        }
//        
//    }
//}
//
//#Preview {
//    //` RestraurantListView(restraurantImage: "biryaani by kilo")
//}

//
////
////  ContentView.swift
////  Swiggy
////
////  Created by Ankit Yadav on 13/01/25.
////
//
//import SwiftUI
//import SwiftData
//
//struct SwiggyView: View {
//    @Environment(\.modelContext) var modelContext
//    
//    @State private var HeaderHeight: CGFloat = 0
//    @Query var restraurant: [Restraurant]
//    
//    
//    
//    var body: some View {
//        
//        NavigationStack {
//            
//            VStack {
//                
//                HeaderView(HeaderHeight: $HeaderHeight)
//                
//                ScrollView {
//                    
//                    LazyVStack (spacing: 10) {
//                        
//                        CircularImageScroll()
//                        
//                        FoodCuisineView()
//                        
//                        ZStack {
//                            
//                            VStack {
//                                
//                                ForEach(restraurant) { restraurant in
//                                    
//                                    RestraurantListView (restraurant: restraurant)
//                                }
//                            }
//                            .padding(.top, 60)
//                            
//                            GeometryReader { gr in
//                                
//                                StickyFilterView()
//                                    .aspectRatio(contentMode: .fill)
//                                    .offset(y: {
//                                        let minY = gr.frame(in: .global).origin.y
//                                        if (minY < HeaderHeight) {
//                                            return HeaderHeight - minY
//                                        }
//                                        else if (minY < 0) {
//                                            return HeaderHeight + abs(minY)
//                                        }
//                                        else {
//                                            return 0
//                                        }
//                                    }())
//                                    .shadow(radius: self.calculateHeight(minHeight: 120,
//                                                                         maxHeight: 300,
//                                                                         yOffset: gr.frame(in: .global).origin.y) < 140 ? 8 : 0)
//                                    
//
//                            }
//                        }
//                    }
//                }
//                .scrollBounceBehavior(.basedOnSize)
//            }
//            .scrollIndicators(.hidden)
//        }
//        .refreshable {
//            // Add function to refresh screen
//        }
//    }
//    
//    func calculateHeight(minHeight: CGFloat, maxHeight: CGFloat, yOffset: CGFloat) -> CGFloat {
//        // If scrolling up, yOffset will be a negative number
//        if maxHeight + yOffset < minHeight {
//            // SCROLLING UP
//            // Never go smaller than our minimum height
//            return minHeight
//        }
//        
//        
//        // SCROLLING DOWN
//        return maxHeight + yOffset
//    }
//}
//
//
//
//#Preview {
//    SwiggyView()
//}
