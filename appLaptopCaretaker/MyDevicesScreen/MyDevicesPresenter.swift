import Foundation

protocol MyDevicesProtocol {
    func getTest()
    func toSettingsScreen()
    func toAddNewDeviceScreen()
    func toDeviceScreen()
}

class MyDevicesPresenter {
    
    weak private var view: MyDevicesViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: MyDevicesViewProtocol) {
        self.view = view
    }
    
}

extension MyDevicesPresenter: MyDevicesProtocol {
    func toDeviceScreen() {
        coordinator.routeDeviceScreen()
    }
    
    func toAddNewDeviceScreen() {
        coordinator.routeToAddNewDeviceScreen()
    }
    
    func toSettingsScreen() {
        coordinator.routeToSettingsScreen()
    }
    
    func getTest() {
        view?.testFunc()
    }
}
