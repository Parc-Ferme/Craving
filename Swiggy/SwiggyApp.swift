//
//  SwiggyApp.swift
//  Swiggy
//
//  Created by Ankit Yadav on 13/01/25.
//

import SwiftUI
import SwiftData

@main
struct SwiggyApp: App {
    var body: some Scene {
        WindowGroup {
            SwiggyView()
        }
        .modelContainer(for: Restraurant.self)
    }
}




