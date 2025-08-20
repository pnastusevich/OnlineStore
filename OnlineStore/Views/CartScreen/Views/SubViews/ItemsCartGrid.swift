
import SwiftUI

struct ItemsCartGrid: View {
    
    @ObservedObject private(set) var viewModel: CartViewModel
    var width: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: width, maxHeight: .infinity)
                .cornerRadius(15)
            
            VStack(alignment: .leading) {
                Text("Доступны для заказа")
                    .font(.title2)
                    .bold()
                    .padding()
                
                Divider()
                
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(viewModel.products, id: \.self) { product in
                        ItemViewCell(viewModel: viewModel, item: product, width: width)
                    }
                }
            }
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel(cartManager: CartManager()))
}
