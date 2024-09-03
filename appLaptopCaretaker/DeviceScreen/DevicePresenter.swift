import Foundation

protocol DevicePresenterProtocol {
    func getTest()
    func toEditScreen()
    func toChekInScreen()
}

class DevicePresenter {
    
    weak private var view: DeviceViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: DeviceViewProtocol) {
        self.view = view
    }
    
}

extension DevicePresenter: DevicePresenterProtocol {
    func toChekInScreen() {
        coordinator.routeToCheckInScreen()
    }
    
    func toEditScreen() {
        coordinator.routeToEditScreen()
    }
    
    func getTest() {
        view?.testFunc()
    }
}
