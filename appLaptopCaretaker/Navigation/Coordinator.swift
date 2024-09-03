import UIKit

final class Coordinator: NSObject, NavigationInterface {

    // MARK: - Property list
    var navigationController: UINavigationController?
    let controllerFactory: ControllerFactoryProtocol
    private let window: UIWindow

    // MARK: - Init
    init(window: UIWindow = UIWindow()) {
        self.window = window
        controllerFactory = ControllerFactory()
    }

    // MARK: - APPLICATION START
    func start() {
        setupWelcomScreen()
        
        window.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()
    }

    func setupWelcomScreen() {
        let welcomController = controllerFactory.createWelcomeVC(coordinator: self)
        navigationController = UINavigationController(rootViewController: welcomController)
        window.rootViewController = navigationController
    }
    
    func addFirstDeviceScreen() {
        let addFirstDeviceController = controllerFactory.createAddFirstDeviceVC(coordinator: self)
        navigationController = UINavigationController(rootViewController: addFirstDeviceController)
        window.rootViewController = navigationController
    }
    
    func myDevicesScreen() {
        let addFirstDeviceController = controllerFactory.createMyDevicesVC(coordinator: self)
        navigationController = UINavigationController(rootViewController: addFirstDeviceController)
        window.rootViewController = navigationController
    }
    
    func routeToSettingsScreen() {
        let vc = controllerFactory.createSettingsVC(coordinator: self)
        vc.hidesBottomBarWhenPushed = true
        vc.title = "Settings"
        navigationPushViewController(vc, animated: true)
    }
    
    func routeToAddNewDeviceScreen() {
        let vc = controllerFactory.createAddNewDeviceVC(coordinator: self)
        vc.title = "Add new device"
        navigationPushViewController(vc, animated: true)
    }
    
    func routeDeviceScreen() {
        let vc = controllerFactory.createDeviceVC(coordinator: self)
        vc.title = "Device"
        navigationPushViewController(vc, animated: true)
    }
    
    func routeToEditScreen() {
        let vc = controllerFactory.createEditVC(coordinator: self)
        vc.title = "Edit device"
        navigationPushViewController(vc, animated: true)
    }
}
