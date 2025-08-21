
import SwiftUI

struct MainTabScreen: View {
    
    @ObservedObject private(set) var appFactory: AppFactory
    @StateObject var cartAdapter: CartAdapter
    @StateObject private var appState = AppState()
    
    init(appFactory: AppFactory) {
        self.appFactory = appFactory
        _cartAdapter = StateObject(wrappedValue: CartAdapter(cartManager: appFactory.cartManger))
    }
    
    var body: some View {
        TabView(selection: $appState.selectedTab) {
            CatalogCoordinatorView(appFactory: appFactory)
                .tabItem {
                    Label("Каталог", systemImage: "contextualmenu.and.cursorarrow")
                }
                .tag(TabItem.home)
            
            CartCoordinatorView(appFactory: appFactory)
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
                .tag(TabItem.cart)
                .badge(cartAdapter.count)
            
            ProfileCoordinatorView()
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
                .tag(TabItem.profile)
        }
        .environmentObject(appState)
    }
}

#Preview {
    MainTabScreen(appFactory: AppFactory())
}
