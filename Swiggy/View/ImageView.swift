import SwiftUI

struct ImageView: View {
    
    //var redactedReason: RedactedReason
    
    @State var isImageTapped: Bool = false
    
    let imageURL: String
    
    var body: some View {
        
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 140, height: 170)
                    .redacted(reason: .placeholder)
                    .cornerRadius(15)
                
            case .success(let image):
                
                image
                    .resizable()
                    .padding(.vertical,5)
                    .frame(width: isImageTapped ? 200 : 140, height: isImageTapped ? 270 : 170)
                    .cornerRadius(15)
                    .shadow(radius: 2)
                    .onLongPressGesture() {
                        
                        isImageTapped.toggle()
                    }
                
            case .failure:
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 140, height: 170)
                    .redacted(reason: .placeholder)
                    .cornerRadius(15)
                    .overlay(
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                    )
                
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    let imageURL: String = "jwbjhw"
    
    
    ImageView(imageURL: imageURL)
}
