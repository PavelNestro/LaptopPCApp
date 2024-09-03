import Foundation

protocol CheckInPresenterProtocol {
    func getTest()
}

class CheckInPresenter {
    
    weak private var view: CheckInViewProtocol?
    
    weak var coordinator: Coordinator!
    
    init(view: CheckInViewProtocol) {
        self.view = view
    }
    
}

extension CheckInPresenter: CheckInPresenterProtocol {
    func getTest() {
        view?.testFunc()
    }
}
