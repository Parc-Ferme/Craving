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
    static let doordash = Color(red: 235/255, green: 90/255, blue: 60/255)
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

// View the image to enlarge it if you scroll below the limit.
struct StretchableImageView: View {
    
    @Binding var isTitleVisible: Bool
    
    let imageName: String
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let yOffset = geometry.frame(in: .global).minY
            let height = max(300 + yOffset, 300) // Stretch height dynamically
            
            AsyncImage(url: URL(string: imageName))
                .scaledToFill()
                .frame(width: geometry.size.width, height: height)
                .clipped()
                .offset(y: yOffset < 0 ? 0 : -yOffset) // Push back up when stretched
                .onChange(of: yOffset) {
                    if yOffset < 0 {
                        isTitleVisible = true
                    } else {
                        isTitleVisible = false
                    }
                }
            
        }
        .frame(height: 300)
    }
}

extension Double {
    func truncated(to: Int) -> String {
        String(format: "%.\(to)f", self)
    }
}



//Sticky Header Modifiers

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
                    .onChange(of: f) { oldFrame, newFrame in
                        frame = newFrame
                    }
                    .preference(key: FramePreferenceKey.self, value: [frame])
            })
    }
}


