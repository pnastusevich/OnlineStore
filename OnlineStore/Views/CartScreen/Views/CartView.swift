import SwiftUI

struct CartView: View {
    
    @ObservedObject private(set) var viewModel: CartViewModel
 
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.mainGray)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Корзина")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        if viewModel.count > 0 {
                            SelectAllView(viewModel: viewModel, width: geometry.size.width)
                            
                            ItemsCartGrid(viewModel: viewModel, width: geometry.size.width)
                            
                            SumOfItemsView(viewModel: viewModel, width: geometry.size.width)
                        } else {
                            EmptyCartView()
                        }
                    }
                }
            }
        }
    }
}
//
//#Preview {
//    CartView(viewModel: CartViewModel(cartManager: CartManager.mock))
//}
