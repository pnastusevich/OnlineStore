import SwiftUI

struct CartView: View {
    
    @ObservedObject private(set) var viewModel: CartViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Корзина")
                .font(.title2)
                .bold()
            
            Spacer()
            
            HStack {
                
                
                
            }
            
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}
