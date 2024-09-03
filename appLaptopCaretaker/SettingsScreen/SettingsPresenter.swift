import Foundation

protocol SettingsPresenterProtocol {
    func getTest()
}

class SettingsPresenter {
    
    weak private var view: SettingsViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: SettingsViewProtocol) {
        self.view = view
    }
    
}

extension SettingsPresenter: SettingsPresenterProtocol {
    func getTest() {
        view?.testFunc()
    }
}
