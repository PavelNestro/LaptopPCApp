import UIKit

protocol MyDevicesViewProtocol: AnyObject {
    func testFunc()
}

class MyDevicesVC: UIViewController {
    
    var deviceArray = [
        Device(name: "MacBook Pro M2", serviceDays: 300, cleanDays: 3, memoryClearingDays: 1, type: "laptop"), Device(name: "My PC", serviceDays: 122, cleanDays: 2, memoryClearingDays: 2, type: "PC")]
    
    var presenter: MyDevicesProtocol!
    
    var rootView: MyDevicesView {
        self.view as! MyDevicesView
    }
    
    override func loadView() {
        self.view = MyDevicesView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        setupNavBar()
        setupTableView()
        chekDevices()
        rootView.greetingsLabel.text = "Hello, Name!"
        rootView.addYourFirsDeviceLabel.text = "Add your first\ndevice!"
    }
    
    func addTargets() {
        rootView.buttonTappedHandler = { [weak self] in
            guard let self else { return }
            self.presenter.toAddNewDeviceScreen()
        }
    }
    
    func setupTableView() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    func chekDevices() {
        if deviceArray.isEmpty == true {
            rootView.addYourFirsDeviceLabel.isHidden = false
        } else {
            rootView.addYourFirsDeviceLabel.isHidden = true
        }
    }
    
    private func setupNavBar() {
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(settingsButtonAction))
        settingsButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc func settingsButtonAction() {
        presenter.toSettingsScreen()
    }
    
}

extension MyDevicesVC: MyDevicesViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}

struct Device {
    let name: String
    let serviceDays: Int
    let cleanDays: Int
    let memoryClearingDays: Int
    let type: String
}
