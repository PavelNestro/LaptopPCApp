
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = Coordinator()
        coordinator?.start()
//        IQKeyboardManager.shared.enable = true
//        print(UserDefaultsManager.token)
        return true
    }
}

