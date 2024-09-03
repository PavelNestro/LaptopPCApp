import Foundation

protocol AddNewDevicePresenterProtocol {
    func getTest()
    func routeToMyDevicesScreen()
}

class AddNewDevicePresenter {
    
    weak private var view: AddNewDeviceViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: AddNewDeviceViewProtocol) {
        self.view = view
    }
    
}

extension AddNewDevicePresenter: AddNewDevicePresenterProtocol {
    func getTest() {
        view?.testFunc()
    }
    
    func routeToMyDevicesScreen() {
        coordinator.myDevicesScreen()
    }
}
