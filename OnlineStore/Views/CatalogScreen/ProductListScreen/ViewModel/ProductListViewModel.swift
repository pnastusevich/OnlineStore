import SwiftUI
import Combine

final class ProductListViewModel: ObservableObject {
    
    @Published private(set) var category: ProductCategory
    @Published private(set) var productsByCategory: [Product] = []
    @Published private(set) var cartProducts: [Product] = []
    
    private weak var coordinator: CatalogCoordinatorProtocol?
    private let cartManager: CartManagerProtocol
    private let networkService: NetworkServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(category: ProductCategory, coordinator: CatalogCoordinatorProtocol? = nil, cartManager: CartManagerProtocol, networkService: NetworkServiceProtocol) {
        self.category = category
        self.coordinator = coordinator
        self.cartManager = cartManager
        self.networkService = networkService
        
        networkService.getProductByCategory(category: category.slug)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Данные получены")
                case .failure(let error):
                    print("Ошибка \(error)")
                }
            } receiveValue: { [weak self] category in
                guard let self else { return }
                self.productsByCategory = category.products
            }
            .store(in: &cancellables)
        
        cartManager.productsPulisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                guard let self else { return }
                self.cartProducts = products
            }
            .store(in: &cancellables)
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
    
    // MARK: - Navigate
    func didSelectProduct(_ product: Product) {
        coordinator?.navigate(to: .detail(product: product))
    }
    
}
