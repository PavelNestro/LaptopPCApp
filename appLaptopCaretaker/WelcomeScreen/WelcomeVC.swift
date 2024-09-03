import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func testFuncWelcomProt()
}

class WelcomeVC: UIViewController {
    
    var presenter: WelcomPresenterProtocol!
    
    var rootView: WelcomeView {
        self.view as! WelcomeView
    }
    
    override func loadView() {
        self.view = WelcomeView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        setupNavBar()
    }
    
    func addTargets() {
        rootView.nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    private func setupNavBar() {
        let skipButton = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipButtonAction))
        skipButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = skipButton
    }
    
    @objc func skipButtonAction() {
        self.navigationController?.popViewController(animated: true)
        self.presenter.routeToAddFirstDeviceScreen()
    }
    
    @objc func nextButtonAction(sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.1,
                           animations: {
                sender.transform = CGAffineTransform.identity
            },
                           completion: { _ in
                self.navigationController?.popViewController(animated: true)
                self.presenter.routeToAddFirstDeviceScreen()
            })
        }
    }
    
}

extension WelcomeVC: WelcomeViewProtocol {
    func testFuncWelcomProt() {
        print("Hello! Enter your name.")
    }
    
    
}
