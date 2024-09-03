import UIKit

// MARK: - Navigation Interface
protocol NavigationInterface: AnyObject {
    
    var navigationController: UINavigationController? { get }
    var topViewController: UIViewController? { get }
    var controllerFactory: ControllerFactoryProtocol { get }
        
    func navigationPresent(_ controller: UIViewController, style: UIModalPresentationStyle, animated: Bool)
    func navigationPushViewController(_ controller: UIViewController, animated: Bool)
    func navigationPopViewController(animated: Bool)
    func navigationPopToRootViewController(animated: Bool)
    func navigationPop(at index: Int, animated: Bool)
}

extension NavigationInterface {
    
    var topViewController: UIViewController? {
        self.navigationController?.visibleViewController
    }
    
    func navigationPresent(_ controller: UIViewController,
                           style: UIModalPresentationStyle = .overCurrentContext,
                           animated: Bool) {
        controller.modalPresentationStyle = style
        
        if let topVC = self.topViewController {
            topVC.present(controller, animated: animated)
            return
        }
        navigationController?.present(controller, animated: animated)
    }
    
    func navigationSetViewController(_ controller: UIViewController, animated: Bool) {
        navigationController?.setViewControllers([controller], animated: animated)
    }
    
    func navigationPushViewController(_ controller: UIViewController, animated: Bool) {
        navigationController?.pushViewController(controller, animated: animated)
    }
    
    func navigationPopViewController(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    func navigationPopToRootViewController(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func navigationPop(at index: Int, animated: Bool) {
        guard let navigationController = navigationController else { return }
        navigationController.popToViewController(navigationController.viewControllers[index], animated: true)
    }
}
