import Foundation

protocol EditNamePresenterProtocol {
    func getTest()
}

class EditNamePresenter {
    
    weak private var view: EditNameViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: EditNameViewProtocol) {
        self.view = view
    }
    
}

extension EditNamePresenter: EditNamePresenterProtocol {
    func getTest() {
        view?.testFunc()
    }
}
