
import SwiftUI

struct MainTabScreen: View {
    
    @ObservedObject private(set) var appFactory: AppFactory
    
    var body: some View {
        TabView {
            CatalogCoordinatorView(appFactory: appFactory)
                .tabItem {
                    Label("Каталог", systemImage: "contextualmenu.and.cursorarrow")
                }
            
            CartCoordinatorView()
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
            
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
