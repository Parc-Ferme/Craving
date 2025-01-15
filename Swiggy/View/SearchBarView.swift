//
//  SearchBarView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        
        HStack {
            TextField("Search", text: $searchText)
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            
        }
        .padding(.horizontal)
        .cornerRadius(10)
        .border(.black)
    }
}

#Preview {
    SearchBarView()
}
