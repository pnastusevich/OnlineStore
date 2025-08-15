
import SwiftUI

final class AppFactory: ObservableObject {

    let dataService: DataServiceProtocol

    init() {
        self.dataService = MockDataService()
    }
    
    func makeCatalogViewModel(coordinator: CatalogCoordinatorProtocol) -> CatalogViewModel {
        CatalogViewModel(dataService: dataService, coordinator: coordinator)
    }
    
    func makeCartViewModel() -> CartViewModel {
        CartViewModel()
    }
    
    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel()
    }

    func makeProductListViewModel(category: Category, coordinator: CatalogCoordinatorProtocol) -> ProductListViewModel {
        ProductListViewModel(item: category, coordinator: coordinator)
    }
    
    func makeDetailProductViewModel(product: Product) -> DetailProductViewModel {
        DetailProductViewModel(product: product)
    }
}
