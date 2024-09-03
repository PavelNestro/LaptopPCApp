import Foundation

protocol WelcomPresenterProtocol {
    func getTest()
    func routeToAddFirstDeviceScreen()
}

class WelcomVCPresenter {
    
    weak private var view: WelcomeViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: WelcomeViewProtocol) {
        self.view = view
    }
    
}

extension WelcomVCPresenter: WelcomPresenterProtocol {
    func routeToAddFirstDeviceScreen() {
        coordinator.addFirstDeviceScreen()
    }
    
    func getTest() {
        view?.testFuncWelcomProt()
    }
}
