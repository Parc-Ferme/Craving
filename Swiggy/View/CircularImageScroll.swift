//
//  CircularImageScroll.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

struct CircularImageScroll: View {
    
    let banners = ["Barista", "BurgerKing", "Chaayos", "greenCravings", "Keventers", "WowMomos"]
    
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    var body: some View {
        
        VStack {
            
            TabView(selection: $currentIndex) {
                
                    ForEach(0..<banners.count, id: \.self) { index in
                        
                        NavigationLink(destination: AccountView()) {
                            
                            Image(banners[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 370, height: 125)
                                .cornerRadius(15)
                                .shadow(radius: index == currentIndex ? 5 : 0)
                                .padding()
                                .tag(index)
                        }
                    }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default dots
            .animation(.easeInOut, value: currentIndex)
            
            HStack(spacing: 8) {
                
                ForEach(0..<banners.count, id: \.self) { index in
                    
                    Circle()
                        .fill(index == currentIndex ? Color.primary : Color.secondary.opacity(0.5))
                        .frame(width: index == currentIndex ? 10 : 6, height: index == currentIndex ? 10 : 6)
                        .animation(.spring(duration: 0.3), value: currentIndex)
                }
            }
            .onAppear() {
                StartTimer ()
            }
            .onDisappear {
                timer?.invalidate()
            }
        }
        .ignoresSafeArea(edges: .leading)
        .ignoresSafeArea(edges: .trailing)
        .frame(height: 151)
        
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
