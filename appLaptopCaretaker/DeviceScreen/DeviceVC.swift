import UIKit

protocol DeviceViewProtocol: AnyObject {
    func testFunc()
}

class DeviceVC: UIViewController {
    
    var device: Device
    
    var presenter: DevicePresenter!
    
    var rootView: DeviceView {
        self.view as! DeviceView
    }
    
    init(device: Device) {
        self.device = device
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = DeviceView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        addTargets()
        getInfoDevice()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let updatedDevice = RealmManager.shared.getDevice(by: device.id) {
            self.device = updatedDevice
        }

        getInfoDevice()
    }
    
    func getInfoDevice() {
        rootView.nameDeviceLabel.text = device.deviceName
        rootView.infoModelDeviceView.configure(with: device)
        rootView.infoCleanDeviceView.configure(with: device)
        
        if let imageData = device.imageDeviceData {
            if let image = UIImage(data: imageData) {
                rootView.photoPCImageView.contentMode = .scaleAspectFill
                rootView.photoPCImageView.image = image
            }
        }
        
        switch device.type {
        case "Laptop":
            rootView.chekInButton.backgroundColor = .mainGreen
        case "PC":
            rootView.chekInButton.backgroundColor = .mainOrange
        default:
            rootView.chekInButton.backgroundColor = UIColor.gray
        }
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
        presenter.toCheckInScreen(with: device)
    }
    
    @objc func editButtonAction() {
        presenter.toEditScreen(with: device)
    }
    
}

extension DeviceVC: DeviceViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
