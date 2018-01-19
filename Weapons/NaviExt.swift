
import  UIKit

extension UINavigationController {
    
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
