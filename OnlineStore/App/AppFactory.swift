
import SwiftUI

final class AppFactory: ObservableObject {

    let dataService: DataServiceProtocol
    let cartManger: CartManagerProtocol

    init() {
        self.dataService = MockDataService()
        self.cartManger = CartManager()
    }
    
    func makeCatalogViewModel(coordinator: CatalogCoordinatorProtocol) -> CatalogViewModel {
        CatalogViewModel(dataService: dataService, coordinator: coordinator)
    }
    
    func makeCartViewModel() -> CartViewModel {
        CartViewModel(cartManager: cartManger)
    }
    
    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel()
    }

    func makeProductListViewModel(category: Category, coordinator: CatalogCoordinatorProtocol,  cartManager: CartManagerProtocol) -> ProductListViewModel {
        ProductListViewModel(item: category, coordinator: coordinator, cartManager: cartManger)
    }
    
    func makeDetailProductViewModel(product: Product) -> DetailProductViewModel {
        DetailProductViewModel(product: product, cartManager: cartManger)
    }
}
