import Foundation

protocol DevicePresenterProtocol {
    func getTest()
    func toEditScreen(with device: Device)
    func toCheckInScreen(with device: Device)
}

class DevicePresenter {
    
    weak private var view: DeviceViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: DeviceViewProtocol) {
        self.view = view
    }
    
}

extension DevicePresenter: DevicePresenterProtocol {
    func toCheckInScreen(with device: Device) {
        coordinator.routeToCheckInScreen(device: device)
    }
    
    func toEditScreen(with device: Device) {
        coordinator.routeToEditScreen(device: device)
    }
    
    func getTest() {
        view?.testFunc()
    }
}
