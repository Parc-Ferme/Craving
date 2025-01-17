//
//  HeaderView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 17/01/25.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var HeaderHeight: CGFloat
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                NavigationLink(destination: LocationView()) {
                    
                    VStack(alignment: .leading, spacing: 1) {
                        
                        HStack(spacing: 3.8) {
                            
                            Image("home")
                                .resizable()
                                .frame(width: 20, height: 18, alignment: .bottom)
                            
                            Text("Home")
                                .offset(y: 4)
                                .frame(height: 20, alignment: .bottom)
                                .font(.montserrat(.extraBold, size: 20))
                            
                            Image(systemName: "chevron.down")
                                .offset(y: 1.6)
                                .scaleEffect(x: 0.8, y: 0.9)
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        Text("Silverstone Circuit, Towcester NN12 8TN, United Kingdom")
                            .lineLimit(1)
                            .frame(width: 250)
                            .truncationMode(.tail)
                            .font(.montserrat(.regular, size: 15))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: AccountView()) {
                        
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 37))
                            .foregroundColor(.black.opacity(0.7))
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            
            SearchBarView()
        }
        .overlay (
            GeometryReader { proxy in
                Color.clear
                    .onChange(of: proxy.frame(in: .global)) { oldFrame, newFrame in
                        
                        HeaderHeight = newFrame.maxY
                    }
            }
        )
    }
}

#Preview {
    @Previewable @State var stickyHeight: CGFloat = 0
    
    HeaderView(HeaderHeight: $stickyHeight)
}
