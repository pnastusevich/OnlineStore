import SwiftUI

struct DetailProductView: View {
    
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    PromoDetailProductView(viewModel: viewModel, width: width)
                    
                    PriceDetailProductView(viewModel: viewModel, width: width)
                    
                    ReviewDetailProductView(viewModel: viewModel, width: width)
                    
                    Rectangle()
                        .frame(width: width,  height: 90)
                        .foregroundStyle(.white.opacity(0.95))
                }
            }
            
            ButtonAddProductToCart(viewModel: viewModel, width: width)
        }
    }
}


