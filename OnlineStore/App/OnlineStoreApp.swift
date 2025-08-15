
import SwiftUI

@main
struct OnlineStoreApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @StateObject private var appFactory = AppFactory()
        
    var body: some Scene {
        WindowGroup {
            MainTabScreen(appFactory: appFactory)
        }
    }
}
