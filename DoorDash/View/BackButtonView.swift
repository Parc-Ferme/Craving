import SwiftUI

struct BackButtonView: View {
    
    var action: DismissAction
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding([.trailing, .top, .bottom], 10)
                .padding(.leading, 5.5)
                .background(Color.white)
                .overlay(
                    Circle()
                        .stroke(LinearGradient(colors: [.doordash, .white], startPoint: .top, endPoint: .bottom), lineWidth: 4)
                )
                .foregroundStyle(Color.primary.opacity(0.6))
                .clipShape(.circle)
                .shadow(radius: 50)
                
        }
    }
}

#Preview {
    @Previewable  @Environment(\.dismiss) var dismiss
    
    BackButtonView (action: dismiss)
}
