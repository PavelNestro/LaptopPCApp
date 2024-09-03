import Foundation

protocol EditPresenterProtocol {
    func getTest()
}

class EditPresenter {
    
    weak private var view: EditViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: EditViewProtocol) {
        self.view = view
    }
    
}

extension EditPresenter: EditPresenterProtocol {    
    func getTest() {
        view?.testFunc()
    }
}
