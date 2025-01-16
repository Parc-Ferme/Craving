//
//  StickyFilterView.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

struct StickyFilterView: View {
    var body: some View {
        HStack {
            Rectangle()
        }
        .ignoresSafeArea(edges: .leading)
        .ignoresSafeArea(edges: .trailing)
        .background(Color.black)
        .frame(height: 50)
    }
}

#Preview {
    StickyFilterView()
}
