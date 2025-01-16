//
//  ContentView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 13/01/25.
//

import SwiftUI

struct SwiggyView: View {
    
    var stickyHeaderHeight: CGFloat = 0
    var isStickyHeaderVisible: Bool = false
    
    let restraurantImages =  ["bbq", "kfc", "cakes", "burger", "tea", "pizza", "paratha", "paneer", "pakoda", "mcdonalds"]
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HeaderView()
                
                ScrollView {
                    
                    LazyVStack (spacing: 10) {
                        
                        CircularImageScroll()
                        
                        FoodCuisineView()
                        
                        ZStack{
                            
                            VStack {
                                
                                ForEach(0..<restraurantImages.count, id: \.self) { index in
                                    
                                    RestraurantListView(restraurantImage: restraurantImages[index])
                                }
                            }
                            .padding(.top, 60)
                            
                            GeometryReader { gr in
                                
                                StickyFilterView()
                                    .aspectRatio(contentMode: .fill)
                                    .offset(y: {
                                        let minY = gr.frame(in: .global).origin.y
                                        if (minY < 172) {
                                            return 172 - minY
                                        }
                                        else if (minY < 0) {
                                            return 172 + abs(minY)
                                        }
                                        else {
                                            return 0
                                        }
                                    }())
                                    .shadow(radius: self.calculateHeight(minHeight: 120,
                                                                         maxHeight: 300,
                                                                         yOffset: gr.frame(in: .global).origin.y) < 140 ? 8 : 0)
                                    .overlay(
                                        Text("SAINZ")
                                            .font(.system(size: 70, weight: .black))
                                            .foregroundColor(.white)
                                            .opacity(0.8))
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .refreshable {
            // Add function to refresh screen
        }
    }
    
    func calculateHeight(minHeight: CGFloat, maxHeight: CGFloat, yOffset: CGFloat) -> CGFloat {
        // If scrolling up, yOffset will be a negative number
        if maxHeight + yOffset < minHeight {
            // SCROLLING UP
            // Never go smaller than our minimum height
            return minHeight
        }
        
        
        // SCROLLING DOWN
        return maxHeight + yOffset
    }
}

#Preview {
    SwiggyView()
}
