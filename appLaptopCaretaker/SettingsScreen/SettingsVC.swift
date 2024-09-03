import UIKit

protocol SettingsViewProtocol: AnyObject {
    func testFunc()
}

class SettingsVC: UIViewController {
    
    var presenter: SettingsPresenterProtocol!
    
    var rootView: SettingsView {
        self.view as! SettingsView
    }
    
    override func loadView() {
        self.view = SettingsView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    func addTargets() {
        print("Экран  SettingsVC включен")
    }
    
}

extension SettingsVC: SettingsViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
