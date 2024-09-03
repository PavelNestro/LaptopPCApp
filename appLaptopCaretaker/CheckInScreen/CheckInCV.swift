import UIKit

protocol CheckInViewProtocol: AnyObject {
    func testFunc()
}

class CheckInCV: UIViewController {
    
    var presenter: CheckInPresenter!
    
    var rootView: CheckInView {
        self.view as! CheckInView
    }
    
    override func loadView() {
        self.view = CheckInView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    func addTargets() {
        print("Экран CheckInCV включен")
    }
    
}

extension CheckInCV: CheckInViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
