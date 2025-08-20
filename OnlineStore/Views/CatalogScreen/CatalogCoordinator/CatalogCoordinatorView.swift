
import SwiftUI

struct CatalogCoordinatorView: View {
    
    @StateObject private var coordinator: CatalogCoordinator
    @State private var path = NavigationPath()
    
    init(appFactory: AppFactory) {
        _coordinator = StateObject(wrappedValue: CatalogCoordinator(appFactory: appFactory))
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            coordinator.makeView()
                .navigationDestination(for: CatalogRoute.self) { route in
                    switch route {
                    case .productsList(let category):
                        coordinator.makeProductListView(category: category)
                    case .detail(let product):
                        coordinator.makeDetailProductView(product: product)
                    }
                }
        }
        .onAppear() {
            coordinator.bindPath($path)
        }
    }
}
