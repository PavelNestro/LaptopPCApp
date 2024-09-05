import UIKit

protocol AddNewDeviceViewProtocol: AnyObject {
    func testFunc()
}

class AddNewDeviceVC: UIViewController, UINavigationControllerDelegate {
    
    let device = Device()
    
    var presenter: AddNewDevicePresenter!
    
    var rootView: AddNewDeviceView {
        self.view as! AddNewDeviceView
    }
    
    override func loadView() {
        self.view = AddNewDeviceView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    func addTargets() {
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        rootView.photoPCImageView.addGestureRecognizer(imageTapGesture)
        
        let typeTapGesture = UITapGestureRecognizer(target: self, action: #selector(typeTextFieldTapped))
        rootView.typeTextField.textField.addGestureRecognizer(typeTapGesture)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        rootView.releaseDateTextField.textField.inputView = datePicker
        
        rootView.doneButton.addTarget(self, action: #selector(donbeButtonAction), for: .touchUpInside)
    }
    
    private func openImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func buttonTapped(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                           gesture.view?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       }) { (_) in
            UIView.animate(withDuration: 0.1,
                           animations: {
                               gesture.view?.transform = CGAffineTransform.identity
                           },
                           completion: { _ in
                self.openImagePicker()
                           })
        }
    }
    
    @objc private func typeTextFieldTapped() {
        let alertController = UIAlertController(title: "Select Device Type", message: nil, preferredStyle: .actionSheet)
        
        let laptopAction = UIAlertAction(title: "Laptop", style: .default) { _ in
            self.rootView.typeTextField.textField.textColor = .black
            self.rootView.typeTextField.textField.text = "Laptop"
        }
        
        let pcAction = UIAlertAction(title: "PC", style: .default) { _ in
            self.rootView.typeTextField.textField.textColor = .black
            self.rootView.typeTextField.textField.text = "PC"
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
    
    @objc private func donbeButtonAction() {
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

        device.type = typeText
        device.deviceName = deviceNameText
        device.deviceModel = rootView.modelTextField.textField.text ?? ""
        device.deviceNumber = rootView.deviceNumberTextField.textField.text ?? ""
        device.characteristics = rootView.characteristicsTextField.textField.text ?? ""
        device.note = rootView.noteTextField.textField.text ?? ""

        if let existingUser = RealmManager.shared.getUser() {
            RealmManager.shared.saveDevice(device, to: existingUser)
        }

        navigationController?.popViewController(animated: true)
    }

}

extension AddNewDeviceVC: AddNewDeviceViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
