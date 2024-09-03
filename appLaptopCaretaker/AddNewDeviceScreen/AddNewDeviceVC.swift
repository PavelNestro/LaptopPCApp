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
        rootView.buttonTappedHandler = { [weak self] in
            guard let self else { return }
            self.openImagePicker()
        }
    }
    
    private func openImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension AddNewDeviceVC: AddNewDeviceViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
