
import SwiftUI

final class AppFactory: ObservableObject {

    let networkService: NetworkServiceProtocol
    let cartManger: CartManagerProtocol

    init() {
        self.networkService = NetworkService(builderURL: BuilderURL())
        self.cartManger = CartManager()
    }
    
    func makeCatalogViewModel(coordinator: CatalogCoordinatorProtocol) -> CatalogViewModel {
        CatalogViewModel(networkService: networkService, coordinator: coordinator)
    }
    
    func makeCartViewModel() -> CartViewModel {
        CartViewModel(cartManager: cartManger)
    }
    
    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel()
    }

    func makeProductListViewModel(category: ProductCategory, coordinator: CatalogCoordinatorProtocol,  cartManager: CartManagerProtocol, networkService: NetworkServiceProtocol) -> ProductListViewModel {
        ProductListViewModel(category: category, coordinator: coordinator, cartManager: cartManger, networkService: networkService)
    }
    
    func makeDetailProductViewModel(product: Product) -> DetailProductViewModel {
        DetailProductViewModel(product: product, cartManager: cartManger)
    }
}
