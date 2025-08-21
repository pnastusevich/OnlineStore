import SwiftUI
import Combine

final class DetailProductViewModel: ObservableObject {
    @Published private(set) var product: Product
    @Published private(set) var cartProducts: [Product] = []
    
    private let cartManager: CartManagerProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(product: Product, cartManager: CartManagerProtocol) {
        self.product = product
        self.cartManager = cartManager
        
        cartManager.productsPulisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                guard let self else { return }
                self.cartProducts = products
            }
            .store(in: &cancellables)
    }
    
    func addProductToCart() {
        cartManager.addProduct(product)
    }
    
    func increaseProduct() {
        if let productInCart = cartProducts.first(where: { $0.id == product.id }) {
                cartManager.increaseCountOfItem(of: productInCart)
            }
    }
    
    func decreaseProduct() {
        if let productInCart = cartProducts.first(where: { $0.id == product.id }) {
            cartManager.decreaseCountOfItem(of: productInCart)
        }
    }
    
    func isInCart() -> Bool {
        cartProducts.contains { $0.id == product.id }
    }
    
    func deleteProductInCart() {
        cartManager.deleteProduct(product)
    }
    
    func quantity() -> Int {
        cartProducts.first(where: { $0.id == product.id })?.count ?? 0
    }
}
