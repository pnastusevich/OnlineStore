
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .mainGray
        appearance.shadowColor = UIColor.black.withAlphaComponent(0.2)
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        return true
    }
}
