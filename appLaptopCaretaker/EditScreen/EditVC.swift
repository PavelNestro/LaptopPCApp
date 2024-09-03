import UIKit

protocol EditViewProtocol: AnyObject {
    func testFunc()
}

class EditVC: UIViewController, UINavigationControllerDelegate {
    
    var presenter: EditPresenter!
    
    var rootView: EditView {
        self.view as! EditView
    }
    
    override func loadView() {
        self.view = EditView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        addTargets()
    }
    
    func addTargets() {
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        rootView.photoPCImageView.addGestureRecognizer(imageTapGesture)
        
        let typeTapGesture = UITapGestureRecognizer(target: self, action: #selector(typeTextFieldTapped))
        rootView.typeTextField.textField.addGestureRecognizer(typeTapGesture)
        
        let serviceTapGesture = UITapGestureRecognizer(target: self, action: #selector(serviceTextFieldAction))
        rootView.serviceTextField.textField.addGestureRecognizer(serviceTapGesture)
        
        let cleanTapGesture = UITapGestureRecognizer(target: self, action: #selector(cleanTextFieldAction))
        rootView.cleanTextField.textField.addGestureRecognizer(cleanTapGesture)
        
        let memoryTapGesture = UITapGestureRecognizer(target: self, action: #selector(memoryTextFieldAction))
        rootView.memoryCleaningTextField.textField.addGestureRecognizer(memoryTapGesture)
        
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
    
    private func setupNavBar() {
        let settingsButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteButtonAction))
        settingsButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc func deleteButtonAction() {
        print("editButton")
    }
}

extension EditVC: EditViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
