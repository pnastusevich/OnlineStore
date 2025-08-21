
import SwiftUI

struct ProductCell: View {

    @ObservedObject private(set) var viewModel: ProductListViewModel
    
    var product: Product
    var width: CGFloat
    
    @State private(set) var isLoading: Bool = false
    
    var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .frame(width: width / 2, height: width / 2)
                        .background(
                            LinearGradient(gradient: Gradient(
                                           colors: [.gray.opacity(0.3), .mainGray]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
                        .cornerRadius(10)

                    ImageSliderInProduct(images: ["basket.fill",
                                                    "basket",
                                                    "cart.fill",
                                                    "cart"]
                    )
                }
       
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Text("\(Int(product.price)) $")
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                                .strikethrough()
                            
                            Text("\(Int(product.discountedPrice)) $")
                                .foregroundStyle(.black)
                                .font(.headline)
                                .bold()
                        }
                        Spacer()
                        
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .frame(width: 25, height: 25)
                                .transition(.scale.combined(with: .opacity))
                                .padding(.horizontal)
                        } else {
                            Button {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isLoading = true
                                }
                                
                                if !viewModel.isInCart(product) {
                                    viewModel.addProductToCart(product)
                                } else {
                                    viewModel.deleteProductInCart(product)
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        isLoading = false
                                    }
                                }
                            } label: {
                                Image(systemName: !viewModel.isInCart(product) ? "cart" : "cart.fill")
                                    .resizable()
                                    .foregroundStyle(!viewModel.isInCart(product) ? .gray : .blue)
                                    .frame(width: 25, height: 25)
                                    .transition(.scale.combined(with: .opacity))
                            }
                            .padding(.horizontal)
                    }
                    }
                    
                    Text("\(product.title)")
                        .foregroundStyle(.black)
                        .font(.system(size: 15))
                    
                    Text("\(product.description)")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Rectangle()
                    .fill(.clear)
                    .cornerRadius(10)
            }
    }
}

#Preview {
    ProductListView(viewModel:
                        ProductListViewModel(item: MockModel.sample.category.first!,
                                             coordinator: CatalogCoordinator(appFactory: AppFactory()), cartManager: CartManager()),
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ])
}
