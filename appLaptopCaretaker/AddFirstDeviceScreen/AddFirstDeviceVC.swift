import UIKit

protocol AddFirstDeviceViewProtocol: AnyObject {
    func testFunc()
}

class AddFirstDeviceVC: UIViewController {
    
    let device = Device()
    
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
        configureName()
    }
    
    func configureName() {
        if let existingUser = RealmManager.shared.getUser() {
            rootView.addFirstDeviceLabel.text = "Good, \(existingUser.name)!\nLet's add your first device."
        } else {
            rootView.addFirstDeviceLabel.text = "Good, Name!\nLet's add your first device."
        }
    }
    
    func addTargets() {
        rootView.typeTextField.textField.addTarget(self, action: #selector(typeTextFieldTapped), for: .touchDown)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        rootView.releaseDateTextField.textField.inputView = datePicker
        
        rootView.doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
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
    
    @objc private func typeTextFieldTapped() {
        let alertController = UIAlertController(title: "Select Device Type", message: nil, preferredStyle: .actionSheet)
        
        let laptopAction = UIAlertAction(title: "Laptop", style: .default) { _ in
            self.rootView.typeTextField.textField.text = "Laptop"
            self.device.type = "Laptop"
        }
        
        let pcAction = UIAlertAction(title: "PC", style: .default) { _ in
            self.rootView.typeTextField.textField.text = "PC"
            self.device.type = "PC"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(laptopAction)
        alertController.addAction(pcAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        rootView.releaseDateTextField.textField.text = dateFormatter.string(from: sender.date)
        self.device.releaseDate = sender.date
    }
    
    @objc private func doneButtonAction() {
        let typeText = rootView.typeTextField.textField.text ?? ""
        let deviceNameText = rootView.deviceNameTextField.textField.text ?? ""

        if typeText.isEmpty {
            rootView.typeTextField.textField.setPlaceholder("Type is required", color: .red)
        } else {
            rootView.typeTextField.textField.setPlaceholder("Type", color: .systemGray)
        }

        if deviceNameText.isEmpty {
            rootView.deviceNameTextField.textField.setPlaceholder("Device Name is required", color: .red)
        } else {
            rootView.deviceNameTextField.textField.setPlaceholder("Device Name", color: .systemGray)
        }

        if typeText.isEmpty || deviceNameText.isEmpty {
            return
        }
        
        device.deviceModel = rootView.modelTextField.textField.text ?? ""
        device.deviceNumber = rootView.deviceNumberTextField.textField.text ?? ""
        device.characteristics = rootView.characteristicsTextField.textField.text ?? ""
        
        if let existingUser = RealmManager.shared.getUser() {
            RealmManager.shared.saveDevice(device, to: existingUser)
        }
        
        presenter.routeToMyDevicesScreen()
        
    }
    
}

extension AddFirstDeviceVC: AddFirstDeviceViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
