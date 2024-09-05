import UIKit

protocol MyDevicesViewProtocol: AnyObject {
    func testFunc()
}

class MyDevicesVC: UIViewController {
    
    var deviceArray = [Device]()
    
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
        getUser()
        chekDevices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let user = RealmManager.shared.getUser() {
            deviceArray = Array(user.devices)
            chekDevices()
            getUser()
            rootView.tableView.reloadData()
        }
    }
    
    func getUser() {
        if let user = RealmManager.shared.getUser() {
            rootView.greetingsLabel.text = "Hello, \(user.name)!"
            deviceArray = Array(user.devices)
        }
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
        rootView.addYourFirsDeviceLabel.text = "Add your first\ndevice!"
        
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
