
import SwiftUI

// MARK: - CatalogRoute
enum CatalogRoute: Hashable {
    case productsList(category: Category)
    case detail(product: Product)
}
// MARK: - CatalogCoordinating Protocol
protocol CatalogCoordinatorProtocol: AnyObject {
    func navigate(to route: CatalogRoute)
    func reset()
}

final class CatalogCoordinator: ObservableObject {
    
    // MARK: - Private Properties
    private let appFactory: AppFactory
    
    @Published private var internalPath = NavigationPath()
    private var path: Binding<NavigationPath>?
    
    // MARK: - Computed Properties
    var currentPath: Binding<NavigationPath> {
        if let path = path {
            return path
        } else {
            return Binding(
                get: { self.internalPath },
                set: { self.internalPath = $0 }
            )
        }
    }
    
    init(appFactory: AppFactory) {
        self.appFactory = appFactory
    }
    
    // MARK: - Public Methods
    func bindPath(_ binding: Binding<NavigationPath>) {
        self.path = binding
    }
    
    func makeView() -> some View {
        CatalogView(viewModel: appFactory.makeCatalogViewModel(coordinator: self))
    }
    
    func makeProductListView(category: Category) -> some View {
        ProductListView(viewModel: appFactory.makeProductListViewModel(category: category, coordinator: self))
    }
    
    func makeDetailProductView(product: Product) -> some View {
        DetailProductView(viewModel: appFactory.makeDetailProductViewModel(product: product))
    }
}

// MARK: - CatalogCoordinating Implementation
extension CatalogCoordinator: CatalogCoordinatorProtocol {
    func navigate(to route: CatalogRoute) {
        currentPath.wrappedValue.append(route)
    }
    
    func reset() {
        currentPath.wrappedValue = NavigationPath()
    }
}
