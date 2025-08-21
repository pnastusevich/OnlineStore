import SwiftUI
import Combine

final class ProductListViewModel: ObservableObject {
    
    @Published var item: Category
    @Published private(set) var cartProducts: [Product] = []
    
    private weak var coordinator: CatalogCoordinatorProtocol?
    private let cartManager: CartManagerProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(item: Category, coordinator: CatalogCoordinatorProtocol? = nil, cartManager: CartManagerProtocol) {
        self.item = item
        self.coordinator = coordinator
        self.cartManager = cartManager
        
        cartManager.productsPulisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                guard let self else { return }
                self.cartProducts = products
            }
            .store(in: &cancellables)
    }
    
    func didSelectProduct(_ product: Product) {
        coordinator?.navigate(to: .detail(product: product))
    }
    
    func addProductToCart(_ product: Product) {
        cartManager.addProduct(product)
    }
    
    func isInCart(_ product: Product) -> Bool {
        cartProducts.contains { $0.id == product.id }
    }
    
    func deleteProductInCart(_ product: Product) {
        cartManager.deleteProduct(product)
    }
}
