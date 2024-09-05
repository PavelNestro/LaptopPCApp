import Foundation

protocol EditPresenterProtocol {
    func getTest()
    func toMyDevicesScreen()
}

class EditPresenter {
    
    weak private var view: EditViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: EditViewProtocol) {
        self.view = view
    }
    
}

extension EditPresenter: EditPresenterProtocol {    
    func toMyDevicesScreen() {
        coordinator.myDevicesScreen()
    }
    
    func getTest() {
        view?.testFunc()
    }
}
