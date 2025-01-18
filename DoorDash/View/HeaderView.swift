import SwiftUI

struct HeaderView: View {
    
    @ObservedObject var restaurantViewModel: RestaurantViewModel
    
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
                        
                        Text("Stratford Halo, High Street, Stratford, London E15 2NE")
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
            
            SearchBarView(restaurantViewModel: restaurantViewModel, searchText: restaurantViewModel.searchText)
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
    
    @Previewable @StateObject var rViewModel = RestaurantViewModel()
    @Previewable @State var stickyHeight: CGFloat = 0
    
    HeaderView(restaurantViewModel: rViewModel, HeaderHeight: $stickyHeight)
}
