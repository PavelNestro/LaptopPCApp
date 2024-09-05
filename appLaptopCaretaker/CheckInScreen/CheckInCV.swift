import UIKit

protocol CheckInViewProtocol: AnyObject {
    func testFunc()
}

class CheckInCV: UIViewController {
    
    let device: Device
    
    var presenter: CheckInPresenter!
    
    var rootView: CheckInView {
        self.view as! CheckInView
    }
    
    init(device: Device) {
        self.device = device
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = CheckInView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    func addTargets() {
        let typeOfCareTapGesture = UITapGestureRecognizer(target: self, action: #selector(typeOfCareButtonAction))
        rootView.typeOfCareTextField.textField.addGestureRecognizer(typeOfCareTapGesture)
        
        rootView.addChekInButton.addTarget(self, action: #selector(addCheckInButtonAction), for: .touchUpInside)
    }
    
    @objc func typeOfCareButtonAction() {
        let alertController = UIAlertController(title: "Select type of care", message: nil, preferredStyle: .actionSheet)
        
        let service = UIAlertAction(title: "Service", style: .default) { _ in
            self.rootView.typeOfCareTextField.textField.text = "Service"
        }
        
        let clean = UIAlertAction(title: "Clean", style: .default) { _ in
            self.rootView.typeOfCareTextField.textField.text = "Clean"
        }
        
        let memoryClean = UIAlertAction(title: "Memory cleaning", style: .default) { _ in
            self.rootView.typeOfCareTextField.textField.text = "Memory cleaning"
        }
        
        alertController.addAction(service)
        alertController.addAction(clean)
        alertController.addAction(memoryClean)

        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func addCheckInButtonAction() {
        var updatedValues: [String: Any] = [:]

        if rootView.typeOfCareTextField.textField.text == "Service" {
            updatedValues["lastCheckServiceInDate"] = Date() // Обновление внутри транзакции
            updatedValues["serviceDays"] = device.serviceDays
        }

        if rootView.typeOfCareTextField.textField.text == "Clean" {
            updatedValues["lastCheckCleanInDate"] = Date() // Обновление внутри транзакции
            updatedValues["cleanDays"] = device.cleanDays
        }

        if rootView.typeOfCareTextField.textField.text == "Memory cleaning" {
            updatedValues["lastCheckMemoryCleanInDate"] = Date() // Обновление внутри транзакции
            updatedValues["memoryCleaningDays"] = device.memoryCleaningDays
        }

        if !updatedValues.isEmpty {
            RealmManager.shared.updateDevice(device, withValues: updatedValues) // Применение изменений через транзакцию
        }

        navigationController?.popViewController(animated: true)
    }


    
}

extension CheckInCV: CheckInViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
