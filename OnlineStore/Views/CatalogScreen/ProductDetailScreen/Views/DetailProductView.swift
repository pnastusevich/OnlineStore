import SwiftUI

struct DetailProductView: View {
    
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
                        PromoDetailProductView(viewModel: viewModel, width: geometry.size.width)
                        
                        PriceDetailProductView(viewModel: viewModel, width: geometry.size.width)
                        
                        ReviewDetailProductView(viewModel: viewModel, width: geometry.size.width)
                        
                        Rectangle()
                            .frame(width: geometry.size.width,  height: 90)
                            .foregroundStyle(.white.opacity(0.95))
                    }
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: geometry.size.width,  height: 90)
                        .foregroundStyle(.white.opacity(0.95))
                    
                    Button {
                        viewModel.addProductToCart()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: max(geometry.size.width - 30, 100),  height: 50)
                                .foregroundStyle(.blue)
                                .cornerRadius(15)
                            
                            Text("Добавить в корзину")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DetailProductView(viewModel: DetailProductViewModel(product: MockModel.sample.category.first!.products.first!, cartManager: CartManager()))
}


