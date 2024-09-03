import UIKit

protocol ControllerFactoryProtocol {
    func createWelcomeVC(coordinator: Coordinator) -> UIViewController
    func createAddFirstDeviceVC(coordinator: Coordinator) -> UIViewController
    func createMyDevicesVC(coordinator: Coordinator) -> UIViewController
    func createSettingsVC(coordinator: Coordinator) -> UIViewController
    func createAddNewDeviceVC(coordinator: Coordinator) -> UIViewController
    func createDeviceVC(coordinator: Coordinator) -> UIViewController
    func createEditVC(coordinator: Coordinator) -> UIViewController
}

// MARK: - FACTORY
final class ControllerFactory: ControllerFactoryProtocol {
    func createAddFirstDeviceVC(coordinator: Coordinator) -> UIViewController {
        let view = AddFirstDeviceVC()
        let presenter = AddFirstDevicePresenter(view: view)
        presenter.coordinator = coordinator
        
        view.presenter = presenter
        
        return view
    }
    
    func createWelcomeVC(coordinator: Coordinator) -> UIViewController {
        let view = WelcomeVC()
        let presenter = WelcomVCPresenter(view: view)
        presenter.coordinator = coordinator

        view.presenter = presenter
        
        return view
    }
    
    func createMyDevicesVC(coordinator: Coordinator) -> UIViewController {
        let view = MyDevicesVC()
        let presenter = MyDevicesPresenter(view: view)
        presenter.coordinator = coordinator

        view.presenter = presenter
        
        return view
    }
    
    func createSettingsVC(coordinator: Coordinator) -> UIViewController {
        let view = SettingsVC()
        let presenter = SettingsPresenter(view: view)
        presenter.coordinator = coordinator

        view.presenter = presenter
        
        return view
    }
    
    func createAddNewDeviceVC(coordinator: Coordinator) -> UIViewController {
        let view = AddNewDeviceVC()
        let presenter = AddNewDevicePresenter(view: view)
        presenter.coordinator = coordinator

        view.presenter = presenter
        
        return view
    }
    
    func createDeviceVC(coordinator: Coordinator) -> UIViewController {
        let view = DeviceVC()
        let presenter = DevicePresenter(view: view)
        presenter.coordinator = coordinator

        view.presenter = presenter
        
        return view
    }
    
    func createEditVC(coordinator: Coordinator) -> UIViewController {
        let view = EditVC()
        let presenter = EditPresenter(view: view)
        presenter.coordinator = coordinator

        view.presenter = presenter
        
        return view
    }
}


