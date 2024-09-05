import UIKit
import StoreKit

protocol SettingsViewProtocol: AnyObject {
    func testFunc()
}

class SettingsVC: UIViewController {
    
    var presenter: SettingsPresenterProtocol!
    
    var rootView: SettingsView {
        self.view as! SettingsView
    }
    
    override func loadView() {
        self.view = SettingsView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    func addTargets() {
        rootView.settingsSectionView.rateAppButton.addTarget(self, action: #selector(rateAppAction), for: .touchUpInside)
        rootView.settingsSectionView.shareAppButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        rootView.privacyPolicyButton.addTarget(self, action: #selector(usageAction), for: .touchUpInside)
        rootView.editNameButton.addTarget(self, action: #selector(editNameButtonAction), for: .touchUpInside)
    }
    
    @objc func rateAppAction(sender: UIButton) {
        createButtonAnimation(with: sender)
        guard let scene = view.window?.windowScene else { return }
        if #available(iOS 14.0, *) {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    @objc func shareAction(sender: UIButton) {
        createButtonAnimation(with: sender)
        let googleURL = URL(string: "https://www.google.com")!
        
        let shareSheetVC = UIActivityViewController(activityItems: [googleURL], applicationActivities: nil)
        
        if let popoverController = shareSheetVC.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(shareSheetVC, animated: true)
    }
    
    @objc func usageAction(sender: UIButton) {
        createButtonAnimation(with: sender)
        let url = URL(string: "https://www.google.com")!
        let vc = WebGlossaryViewController(url: url)
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func editNameButtonAction(sender: UIButton) {
        createButtonAnimation(with: sender)
        presenter.toEditNameScreen()
    }
    
    func createButtonAnimation(with sender: UIButton) {
        UIView.animate(withDuration: 0.25, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.25, animations: {
                sender.transform = CGAffineTransform.identity
            })
        }
    }
    
}

extension SettingsVC: SettingsViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
