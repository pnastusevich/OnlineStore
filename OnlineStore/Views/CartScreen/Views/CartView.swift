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
                        
                        SelectAllView(width: geometry.size.width)
                        
                        ItemsCartCell(width: geometry.size.width)
                        
                        SumOfItemsView(width: geometry.size.width)
                    }
                }
            }
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}
