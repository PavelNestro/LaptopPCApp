import UIKit

protocol AddNewDeviceViewProtocol: AnyObject {
    func testFunc()
}

class AddNewDeviceVC: UIViewController, UINavigationControllerDelegate {
    
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
            self.rootView.typeTextField.textField.text = "Laptop"
        }
        
        let pcAction = UIAlertAction(title: "PC", style: .default) { _ in
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
    }
}

extension AddNewDeviceVC: AddNewDeviceViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
