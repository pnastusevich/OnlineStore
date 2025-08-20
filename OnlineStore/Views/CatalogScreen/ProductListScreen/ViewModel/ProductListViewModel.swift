import SwiftUI

final class ProductListViewModel: ObservableObject {
    
    @Published var item: Category
    private weak var coordinator: CatalogCoordinatorProtocol?
    private let cartManager: CartManagerProtocol
    
    init(item: Category, coordinator: CatalogCoordinatorProtocol? = nil, cartManager: CartManagerProtocol) {
        self.item = item
        self.coordinator = coordinator
        self.cartManager = cartManager
    }
    
    func didSelectProduct(_ product: Product) {
        coordinator?.navigate(to: .detail(product: product))
    }
    
    func addProductToCart(_ product: Product) {
        cartManager.addProduct(product)
    }
}
