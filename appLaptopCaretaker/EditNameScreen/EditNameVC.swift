import UIKit

protocol EditNameViewProtocol: AnyObject {
    func testFunc()
}

class EditNameVC: UIViewController {
    
    
    var presenter: EditNamePresenter!
    
    var rootView: EditNameView {
        self.view as! EditNameView
    }
    
    override func loadView() {
        self.view = EditNameView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    func addTargets() {
        rootView.doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
    }
    
    @objc func doneButtonAction() {
        guard let newName = rootView.editNameTextField.textField.text, !newName.isEmpty else {
            return
        }
        
        guard let user = RealmManager.shared.getUser() else {
            print("user not found")
            return
        }

        RealmManager.shared.updateUser(user, withName: newName)

        print("тame user \(newName)")

        navigationController?.popViewController(animated: true)
    }
    
}

extension EditNameVC: EditNameViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
