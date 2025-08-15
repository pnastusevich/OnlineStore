import SwiftUI

final class ProductListViewModel: ObservableObject {
    
    @Published var item: Category
    private weak var coordinator: CatalogCoordinatorProtocol?
    
    init(item: Category, coordinator: CatalogCoordinatorProtocol? = nil) {
        self.item = item
        self.coordinator = coordinator
    }
    
    func didSelectProduct(_ product: Product) {
        coordinator?.navigate(to: .detail(product: product))
    }
    
}
