//
//  ContentView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 13/01/25.
//

import SwiftUI

struct SwiggyView: View {
    
    @State private var HeaderHeight: CGFloat = 0
    
    let restraurantImages =  ["bbq", "kfc", "cakes", "burger", "tea", "pizza", "paratha", "paneer", "pakoda", "mcdonalds"]
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HeaderView(HeaderHeight: $HeaderHeight)
                
                ScrollView {
                    
                    LazyVStack (spacing: 10) {
                        
                        CircularImageScroll()
                        
                        FoodCuisineView()
                        
                        ZStack {
                            
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
                                        if (minY < HeaderHeight) {
                                            return HeaderHeight - minY
                                        }
                                        else if (minY < 0) {
                                            return HeaderHeight + abs(minY)
                                        }
                                        else {
                                            return 0
                                        }
                                    }())
                                    .shadow(radius: self.calculateHeight(minHeight: 120,
                                                                         maxHeight: 300,
                                                                         yOffset: gr.frame(in: .global).origin.y) < 140 ? 8 : 0)
                                    

                            }
                        }
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
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
