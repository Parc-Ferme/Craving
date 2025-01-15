//
//  ContentView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 13/01/25.
//

import SwiftUI

struct SwiggyView: View {
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HeaderView()
                    .border(.red)
                
                ScrollView {
                    
                    LazyVStack (spacing: 16) {
                        
                        Section {
                            CircularImageScroll()
                        }
                       
                        
                        SectionView(title: "Cuisines") {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    // Add your content here
                                    ForEach(0..<10) { index in
                                        Text("Item \(index)")
                                            .frame(width: 100, height: 60) // Each item width and height
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .padding(.horizontal, 5) // Optional padding between items
                                    }
                                }
                                .frame(height: 60) // Set the height of the HStack to 60
                            }
                            .frame(maxWidth: .infinity, maxHeight: 60) // Ensure the ScrollView takes full width and 60 height
                            .border(.brown)
                        }
                        .border(.red)
                        
                        SectionView(title: "Restraurants") {
                            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                                Section(header:
                                            Text("Row 1")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                ) {
                                    ForEach(2..<20) { index in
                                        Text("Row \(index)")
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(Color.green)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .border(.red)
                        
                    }
                }
                
            }
            .refreshable {
                // Add function to refresh screen
            }
        }
        .border(.red)
        //.edgesIgnoringSafeArea(.top)
        
        
        // Handle Screen Refresh
    }
    
}


struct HeaderView: View {
    
    var body: some View {
        VStack {
            
            HStack {
                
                NavigationLink(destination: LocationView()) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                            Image(systemName: "chevron.down")
                        }
                        .border(.red)
                        
                        Text("Silverstone Circuit, Towcester NN12 8TN, United Kingdom")
                            .lineLimit(1)
                            .frame(width: 300)
                            .truncationMode(.tail)
                        
                        
                    }
                
                    Spacer()
                    
                    NavigationLink(destination: AccountView()) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 37))
                    }
                    .border(.red)
                }
            }
            .padding(.horizontal)
            
            SearchBarView()
            
            
        }
    }
}


struct SectionView<Content: View> : View {
    
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.headline)
                .foregroundStyle(.black)
            content
        }
    }
}

#Preview {
    SwiggyView()
}
