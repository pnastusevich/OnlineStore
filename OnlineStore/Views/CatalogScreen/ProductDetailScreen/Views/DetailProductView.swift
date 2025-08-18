import SwiftUI

struct DetailProductView: View {
    
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    PromoDetailProductView(viewModel: viewModel, width: geometry.size.width)
                    
                    PriceDetailProductView(viewModel: viewModel, width: geometry.size.width)
                    
                    ReviewDetailProductView(viewModel: viewModel, width: geometry.size.width)
                }
            }
        }
    }
}

#Preview {
    DetailProductView(viewModel: DetailProductViewModel(product: MockModel.sample.category.first!.products.first!))
}


