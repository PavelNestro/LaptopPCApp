import UIKit

protocol EditViewProtocol: AnyObject {
    func testFunc()
}

class EditVC: UIViewController {
    
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
        print("Экран EditVC включен")
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
