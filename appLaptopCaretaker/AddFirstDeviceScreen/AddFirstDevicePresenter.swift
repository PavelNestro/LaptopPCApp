import Foundation

protocol AddFirstDeviceProtocol {
    func getTest()
    func routeToMyDevicesScreen()
}

class AddFirstDevicePresenter {
    
    weak private var view: AddFirstDeviceViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: AddFirstDeviceViewProtocol) {
        self.view = view
    }
    
}

extension AddFirstDevicePresenter: AddFirstDeviceProtocol {
    func getTest() {
        view?.testFunc()
    }
    
    func routeToMyDevicesScreen() {
        coordinator.myDevicesScreen()
    }
}
