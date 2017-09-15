import UIKit
import BVSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let navController : DemoNavigationController = {
        
        let homeViewController = HomeViewController(nibName: "HomeView", bundle: nil)
        homeViewController.navigationItem.titleView = HomeViewController.createTitleLabel()
        let navController = DemoNavigationController(rootViewController:homeViewController)
        return navController
        
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        BVSDKManager.configure(.staging)
        BVSDKManager.shared().setLogLevel(.verbose)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}

