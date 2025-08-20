
import SwiftUI

struct MainTabScreen: View {
    
    @ObservedObject private(set) var appFactory: AppFactory
    @StateObject var cartAdapter: CartAdapter
    
    init(appFactory: AppFactory) {
        self.appFactory = appFactory
        _cartAdapter = StateObject(wrappedValue: CartAdapter(cartManager: appFactory.cartManger))
    }
    
    var body: some View {
        TabView {
            CatalogCoordinatorView(appFactory: appFactory)
                .tabItem {
                    Label("Каталог", systemImage: "contextualmenu.and.cursorarrow")
                }
            
            CartCoordinatorView(appFactory: appFactory)
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
                .badge(cartAdapter.count)
            
            ProfileCoordinatorView()
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabScreen(appFactory: AppFactory())
}
