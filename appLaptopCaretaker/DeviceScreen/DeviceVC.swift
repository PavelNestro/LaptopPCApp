import UIKit

protocol DeviceViewProtocol: AnyObject {
    func testFunc()
}

class DeviceVC: UIViewController {
    
    var presenter: DevicePresenter!
    
    var rootView: DeviceView {
        self.view as! DeviceView
    }
    
    override func loadView() {
        self.view = DeviceView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        addTargets()
        rootView.infoModelDeviceView.configure()
    }
    
    func addTargets() {
        rootView.chekInButton.addTarget(self, action: #selector(checkInButtonAction), for: .touchUpInside)
    }
    
    private func setupNavBar() {
        let settingsButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonAction))
        settingsButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc func checkInButtonAction() {
        presenter.toChekInScreen()
    }
    
    @objc func editButtonAction() {
        presenter.toEditScreen()
    }
    
}

extension DeviceVC: DeviceViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
