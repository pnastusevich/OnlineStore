import SwiftUI

enum TabItem {
    case home, cart, profile
}

final class AppState: ObservableObject {
    @Published var selectedTab: TabItem = .home
}
