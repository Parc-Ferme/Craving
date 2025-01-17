//
//  StickyFilterView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

struct StickyFilterView: View {
    var body: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
            
            HStack (spacing: 16){
                
                DynamicCapsuleButton(text: "Filter", systemImageName: "line.3.horizontal.decrease") {
                    print("Filter tapped")
                }
                .padding(.leading, 10)
                
                DynamicCapsuleButton(text: "Sort By", systemImageName: "arrow.up.circle") {
                    print("Sort By tapped")
                }
                
                DynamicCapsuleButton(text: "Ratings 4.0+") {
                    print("Sort By tapped")
                }
                
                DynamicCapsuleButton(text: "Bestseller", systemImageName: "star.circle") {
                    print("Sort By tapped")
                }
                
            }
            .ignoresSafeArea(edges: .leading)
            .ignoresSafeArea(edges: .trailing)
            .padding(.top, 10)
            .frame(height: 70)
            .background(.white)
        }
        
    }
}

struct DynamicCapsuleButton: View {
    
    var text: String
    var systemImageName: String? = nil
    var action: () -> Void

    var body: some View {
        
        Button(action: action) {
            
            HStack(spacing: 8) {
                
                Text(text)
                    .font(.montserrat(.bold, size: 15))
                
                if let systemImageName = systemImageName {
                    Image(systemName: systemImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                }
            }
            .padding(.horizontal, 13)
            .padding(.vertical, 10)
            .overlay(
                            Capsule()
                                .stroke(LinearGradient(gradient: Gradient(colors: [.swiggy, .darkGreen]),
                                                       startPoint: .leading,
                                                       endPoint: .trailing),
                                        lineWidth: 1)
                        )
            .foregroundColor(.primary.opacity(0.6))
        }
    }
}

extension View {
    func sticky (_ stickyRects: [CGRect], _ containerName: String) -> some View {
        return modifier(Sticky(stickyRects: stickyRects, containerName: containerName))
    }
}

struct FramePreferenceKey: PreferenceKey {
    static var defaultValue: [CGRect] = []
    
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

struct Sticky: ViewModifier {
    
    var stickyRects: [CGRect]
    var containerName: String
    @State var frame: CGRect = .zero
    
    var isSticky: Bool {
        frame.minY < 0
    }
    
    var offsetValue: CGFloat {
        guard isSticky else { return 0 }
        
        var offValue = abs(frame.minY)
        
        if let firstStickyRect = stickyRects.first(where: { $0.minY > frame.minY && $0.minY < frame.height}) {
            
            offValue -= (frame.height - firstStickyRect.minY)
            
        }
        
        return offValue
    }
    
    func body(content: Content) -> some View {
        content
            .offset(y: offsetValue)
            .zIndex(isSticky ? .infinity : 0)
            .overlay(GeometryReader { proxy in
                let f = proxy.frame(in: .named(self.containerName))
                
                Color.clear
                    .onAppear {
                        self.frame = f
                    }
                    .onChange(of: f) {
                        frame = $0
                    }
                    .preference(key: FramePreferenceKey.self, value: [frame])
            })
    }
}

#Preview {
    StickyFilterView()
}
