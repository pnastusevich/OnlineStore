
import SwiftUI

struct ButtonAddProductToCart: View {
    
    @EnvironmentObject var appState: AppState
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    var width: CGFloat
    
    @Namespace private var animationNamespace
        
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width,  height: 90)
                .foregroundStyle(.white)
                .cornerRadius(10)
            
            HStack(spacing: 10) {

                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 1, blendDuration: 0.5)) {
                        if !viewModel.isInCart() {
                            viewModel.addProductToCart()
                        } else {
                            appState.selectedTab = .cart
                            print("asd")
                        }
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: max(!viewModel.isInCart() ? width - 30 : width - 160, 100),  height: 50)
                            .foregroundStyle(!viewModel.isInCart() ? .blue: .green)
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: "cartButton", in: animationNamespace)
                        
                        Text(!viewModel.isInCart() ? "Добавить в корзину" : "В корзине")
                            .foregroundStyle(.white)
                            .matchedGeometryEffect(id: "cartText", in: animationNamespace)
                    }
                }
                                
                if viewModel.isInCart() {
                    
                    HStack(spacing: 25) {
                        Button {
                            if viewModel.quantity() > 1 {
                                viewModel.decreaseProduct()
                            } else if viewModel.quantity() == 1 {
                                viewModel.deleteProductInCart()
                            }
                        } label: {
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.blue)
                        }
                        
                        Text("\(viewModel.quantity())")
                            .font(.system(size: 18))
                        
                        Button {
                            viewModel.increaseProduct()
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.blue)
                        }
                        
                    }
                    .frame(width: 120, height: 50)
                    .background(Color(.mainGray))
                    .cornerRadius(5)
                    .transition(.move(edge: .trailing).combined(with: .opacity))

                }
            }
            .padding(.horizontal)
        }
        .animation(.spring(response: 0.4, dampingFraction: 1), value: viewModel.isInCart())
    }
}

#Preview {
    DetailProductView(viewModel: DetailProductViewModel(product: MockModel.sample.category.first!.products.first!, cartManager: CartManager()))
}
