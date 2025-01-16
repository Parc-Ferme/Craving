//
//  SearchBarView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var index = 0
    @State private var searchText = ""
    @State private var timer: Timer?
    
    let randomCravings: [String] = ["Indian", "Chinese", "Italian", "American", "Japanese", "Mexican", "Korean", "Bakery", "Fast Food", "Dessert"]
    
    var body: some View {
        
        HStack {
            
            TextField("Search for '\(randomCravings[index])'", text: $searchText)
                .cornerRadius(15)
                .padding()
                .animation(.easeInOut(duration: 0.5), value: index)
                
            Image(systemName: "magnifyingglass")
                .foregroundColor(.primary.opacity(0.5))
                .padding()
        }
        .frame(width: 370, height: 45)
        .background(RoundedRectangle(cornerRadius: 9).strokeBorder(Color.primary.opacity(0.2), lineWidth: 1.6)) // Apply border and corner radius to HStack
        .background(.white)
        .cornerRadius(9)
        .onAppear {
            StartTime()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func StartTime() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            
            withAnimation {
                index = (index + 1) % randomCravings.count
            }
        }
    }
}

#Preview {
    SearchBarView()
}
