//
//  CircularImageScroll.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

struct CircularImageScroll: View {
    
    let banners = ["image1", "image2", "image3", "image4"]
    
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            
            TabView(selection: $currentIndex) {
                ForEach(0..<banners.count, id: \.self) { index in
                    GeometryReader { geometry in
                        Image(banners[index])
                            .resizable()
                            .cornerRadius(14)
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.8, height: 150)
                            .shadow(radius: index == currentIndex ? 5 : 0)
                            .padding(.horizontal, 10)
                            .tag(index)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        // Track drag offset
                                        dragOffset = value.translation.width
                                    }
                                    .onEnded { value in
                                        // If dragging left to right (negative offset)
                                        if dragOffset > 50 {
                                            // Go backward to the last banner directly
                                            withAnimation(.easeInOut) {
                                                currentIndex = (currentIndex - 1 + banners.count) % banners.count
                                            }
                                        }
                                        // If dragging right to left (positive offset)
                                        else if dragOffset < -50 {
                                            // Go forward to the first banner directly
                                            withAnimation(.easeInOut) {
                                                currentIndex = (currentIndex + 1) % banners.count
                                            }
                                        }
                                        dragOffset = 0
                                    }
                            )
                    }
                }
                .frame(height: 150)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default dots
            .animation(.easeInOut, value: currentIndex)
            
            HStack(spacing: 8) {
                ForEach(0..<banners.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.primary : Color.secondary.opacity(0.5))
                        .frame(width: index == currentIndex ? 12 : 8, height: index == currentIndex ? 12 : 8)
                        .animation(.easeInOut(duration: 0.3), value: currentIndex)
                }
            }
            .onAppear() {
                StartTimer ()
            }
            .onDisappear {
                timer?.invalidate()
            }
            
        }
        .frame(width: .infinity, height: 151)
        .ignoresSafeArea(edges: .leading)
        .ignoresSafeArea(edges: .trailing)
        
    }
    
    private func StartTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            // Change the currentIndex every 2 seconds and loop back to 0 when reaching the end
            withAnimation(.easeInOut) {
                currentIndex = (currentIndex + 1) % banners.count
            }
        }
    }
}

#Preview {
    CircularImageScroll()
}
