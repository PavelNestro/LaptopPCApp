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
        let user = RealmManager.shared.getUser()
        
        if user != nil {
            myDevicesScreen()
        } else {
            setupWelcomScreen()
        }
        
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
    
    func routeDeviceScreen(device: Device) {
        let vc = controllerFactory.createDeviceVC(coordinator: self, device: device)
        vc.title = "Device"
        navigationPushViewController(vc, animated: true)
    }
    
    func routeToEditScreen(device: Device) {
        let vc = controllerFactory.createEditVC(coordinator: self, device: device)
        vc.title = "Edit device"
        navigationPushViewController(vc, animated: true)
    }
    
    func routeToCheckInScreen(device: Device) {
        let vc = controllerFactory.createCheckInVC(coordinator: self, device: device)
        vc.title = "Check-In"
        navigationPushViewController(vc, animated: true)
    }
    
    func routeToEditNameScreen() {
        let vc = controllerFactory.createEditNameVC(coordinator: self)
        vc.title = "Edit Name"
        navigationPushViewController(vc, animated: true)
    }
}
