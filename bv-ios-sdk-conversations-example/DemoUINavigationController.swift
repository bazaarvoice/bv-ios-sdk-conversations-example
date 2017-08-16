import UIKit

class DemoNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor(red: 0, green: 0.24, blue: 0.3, alpha: 1.0)
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barStyle = .black;
    }
}
