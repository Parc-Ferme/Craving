//
//  RestraurantDetailView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI
struct StretchableImageView: View {
    
    @Binding var isTitleVisible: Bool
    
    let imageName: String

    var body: some View {
        GeometryReader { geometry in
            let yOffset = geometry.frame(in: .global).minY
            let height = max(300 + yOffset, 300) // Stretch height dynamically
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: height)
                .clipped()
                .offset(y: yOffset < 0 ? yOffset : 0) // Push back up when stretched
                .onChange(of: yOffset) {
                    if yOffset < 0 {
                        isTitleVisible = true
                    } else {
                        isTitleVisible = false
                    }
                }
                   
        }
        .frame(height: 300)
    }
}

struct RestraurantDetailView: View {
    
    let restraurantImages =  ["bbq", "kfc", "cakes", "burger", "tea", "pizza", "paratha", "paneer", "pakoda", "mcdonalds"]
    
    @State var frames: [CGRect] = []
    var coordinateName = "RestraurantDetails"
    
    @State private var isTitleVisible: Bool = false
    
    var body: some View {
        
        NavigationStack() {
            ScrollView {
                ZStack {
                    
                    StretchableImageView(isTitleVisible: $isTitleVisible, imageName: "paneer")
                        .scrollTransition {
                                                    content, phase in
                                                    content
                                                        .blur(radius: phase.isIdentity ? 0 : 10)
                                                }
                    
                }
                
                VStack() {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Punjabi Angithi (Vegora...)")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 6) {
                            Image(systemName: "star.circle.fill")
                                .foregroundColor(.yellow)
                                .font(.subheadline)
                            Text("4.64 · 70K reviews")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Text("35-40 mins · Dwarka 2, New Delhi")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        FadingLineView(color: .swiggy, height: 1)
                        
                        
                        VStack(alignment: .leading) {
                            Text("North Indian, Chinese, Tandoor")
                                .fontWeight(.medium)
                            Text("Free delivery over $20")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        FadingLineView(color: .swiggy, height: 1)
                        
                    }
                    .padding()
                    
                    StickyFilterView()
                        .sticky(frames, coordinateName)
                    
                    VStack() {
                        ForEach(0..<10) { _ in
                            
                            ForEach(0..<restraurantImages.count, id: \.self) { index in
                                
                                RestraurantListView(restraurantImage: restraurantImages[index])
                            }
                        }
                    }
                    
                    
                }
            }
            .edgesIgnoringSafeArea(.top)
            .coordinateSpace(name: coordinateName)
            .onPreferenceChange(FramePreferenceKey.self, perform: {
                frames = $0.sorted { $0.minY < $1.minY }
            })
            .navigationTitle(isTitleVisible ? "Punjabi Angithi" : "")
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.white, for: .navigationBar)
        }
        
    }
}

#Preview {
    RestraurantDetailView()
}
