//
//  DesignSystems.swift
//  Swiggy
//
//  Created by Ankit Yadav on 16/01/25.
//

import SwiftUI

// Enum to hold the Montserrat font weights for type safety
enum MontserratWeight: String {
    case regular = "Montserrat-Regular"
    case extraBold = "Montserrat-ExtraBold"
    case bold = "Montserrat-Bold"
    case light = "Montserrat-Light"
    case semiBold = "Montserrat-SemiBold"
    case thin = "Montserrat-Thin"
}

// MARK: Design System Colors
extension Color {
    static let darkGreen = Color(red: 0.0, green: 0.5, blue: 0.0)
    static let darkPurple = Color(red: 68/255, green: 23/255, blue: 82/255)
    static let gold = Color(red: 223/255, green: 151/255, blue: 85/255)
    static let swiggy = Color(red: 235/255, green: 90/255, blue: 60/255)
}

// MARK: Custom Fonts
extension Font {
    // A helper function to customize the font size
    static func montserrat(_ weight: MontserratWeight, size: CGFloat) -> Font {
        return Font.custom(weight.rawValue, size: size)
    }
    
    // Predefined static fonts with default size
    static let montserratRegular = Font.custom("Montserrat-Regular", size: 14)
    static let montserratExtraBold = Font.custom("Montserrat-ExtraBold", size: 14)
    static let montserratBold = Font.custom("Montserrat-Bold", size: 14)
    static let montserratLight = Font.custom("Montserrat-Light", size: 14)
    static let montserratSemiBold = Font.custom("Montserrat-SemiBold", size: 14)
    static let montserratThin = Font.custom("Montserrat-Thin", size: 14)
}

// MARK: Fading Line
struct FadingLineView: View {
    
    var color: Color = .gray
    var height: CGFloat = 1.5
    
    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                gradient: Gradient(colors: [color.opacity(1.0), color.opacity(0.0)]),
                startPoint: .leading,
                endPoint: .trailing
            ))
            .frame(height: height) // Adjust thickness of the line
    }
}
