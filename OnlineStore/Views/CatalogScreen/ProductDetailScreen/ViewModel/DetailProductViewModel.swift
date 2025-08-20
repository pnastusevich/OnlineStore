import SwiftUI

final class DetailProductViewModel: ObservableObject {
    @Published private(set) var product: Product
    
    private let cartManager: CartManagerProtocol
    
    init(product: Product, cartManager: CartManagerProtocol) {
        self.product = product
        self.cartManager = cartManager
    }
    
    func addProductToCart() {
        cartManager.addProduct(product)
    }
}
