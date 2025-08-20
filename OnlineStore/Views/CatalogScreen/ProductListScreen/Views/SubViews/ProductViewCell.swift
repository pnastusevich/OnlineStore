
import SwiftUI

struct ProductViewCell: View {

    @ObservedObject private(set) var viewModel: ProductListViewModel
    var product: Product
    var width: CGFloat
    
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

                    ProductViewImageSlider(images: ["basket.fill",
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
                        
                        Button {
                            viewModel.addProductToCart(product)
                        } label: {
                            Image(systemName: "cart")
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal)
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
