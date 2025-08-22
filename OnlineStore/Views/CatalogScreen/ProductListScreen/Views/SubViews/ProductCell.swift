
import SwiftUI

struct ProductCell: View {

    @ObservedObject private(set) var viewModel: ProductListViewModel
    
    var product: Product
    var width: CGFloat
    
    @State private(set) var isLoading: Bool = false
    
    private var finalPrice: Double {
        product.price * (1 - product.discountPercentage / 100)
    }
    
    var body: some View {
        VStack {
            ImageSliderInProduct(images: product.images)
                .frame(width: width, height: width)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text("\(formatPrice(product.price)) $")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                            .strikethrough()
                        
                        Text("\(formatPrice(finalPrice)) $")
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
                    .padding(.bottom, 5)
                
                Text("\(product.description)")
                    .foregroundStyle(.gray)
                    .font(.system(size: 13))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.yellow)
                    
                    Text(formatPrice(product.rating))
                        .font(.system(size: 13))
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.gray)
                        
                        Text("\(product.reviews.count) отзыва")
                            .font(.system(size: 13))
                            .bold()
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
    
    private func formatPrice(_ price: Double) -> String {
        String(format: "%.2f", price)
    }
}


