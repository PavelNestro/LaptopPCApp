import UIKit

protocol AddFirstDeviceViewProtocol: AnyObject {
    func testFunc()
}

class AddFirstDeviceVC: UIViewController {
    
    var presenter: AddFirstDeviceProtocol!
    
    var rootView: AddFirstDeviceView {
        self.view as! AddFirstDeviceView
    }
    
    override func loadView() {
        self.view = AddFirstDeviceView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        setupNavBar()
        rootView.addFirstDeviceLabel.text = "Good, Name!\nLet's add your first device."
    }
    
    func addTargets() {
        print("Экран  AddFirstDeviceVC включен")
    }
    
    private func setupNavBar() {
        let skipButton = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipButtonAction))
        skipButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = skipButton
    }
    
    @objc func skipButtonAction() {
        navigationController?.popViewController(animated: true)
        presenter.routeToMyDevicesScreen()
    }
    
}

extension AddFirstDeviceVC: AddFirstDeviceViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
