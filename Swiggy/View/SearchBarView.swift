import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var restaurantViewModel: RestaurantViewModel
    
    @State var index = 0
    @State var timer: Timer?
    @State var isEditing = false
    @State var searchText: String
    
    
    let randomCravings: [String] = ["Indian", "Chinese", "Italian", "American", "Japanese", "Mexican", "Korean", "Bakery", "Fast Food", "Dessert"]
    
    var body: some View {
        
        HStack {
            
            TextField("Search for '\(randomCravings[index])'", text: $searchText)
                .padding()
                .autocorrectionDisabled(true)
                .animation(.easeInOut(duration: 0.5), value: index)
                .opacity(isEditing || !searchText.isEmpty ? 1.0 : 0.5)
                .onTapGesture {
                    self.isEditing = true
                }
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.primary.opacity(0.5))
                .padding()
        }
        .frame(width: 370, height: 45)
        .background(RoundedRectangle(cornerRadius: 9).strokeBorder(Color.primary.opacity(0.2), lineWidth: 1.6)) // Apply border and corner radius to HStack
        .background(.white)
        .cornerRadius(9)
        .onAppear {
            StartTime()
        }
        .onDisappear {
            timer?.invalidate()
        }
        .onChange(of: restaurantViewModel.searchText) { oldValue, newValue in
            timer?.invalidate()
            restaurantViewModel.SearchRestaurant(newValue)
        }
    }
    
    private func StartTime() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            
            withAnimation {
                index = (index + 1) % randomCravings.count
            }
        }
    }
}

#Preview {
    
    @Previewable @StateObject var rViewModel = RestaurantViewModel()
    SearchBarView(restaurantViewModel: rViewModel, searchText: rViewModel.searchText)
}
