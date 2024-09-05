import UIKit

protocol EditViewProtocol: AnyObject {
    func testFunc()
}

class EditVC: UIViewController, UINavigationControllerDelegate {
    
    let device: Device
    
    var selectedImage: UIImage?
    
    var presenter: EditPresenter!
    
    var rootView: EditView {
        self.view as! EditView
    }
    
    init(device: Device) {
        self.device = device
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = EditView()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        addTargets()
        setupUI()
    }
    
    func setupUI() {
        rootView.typeTextField.textField.text = device.type
        rootView.deviceNameTextField.textField.text = device.deviceName
        rootView.modelTextField.textField.text = device.deviceModel
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        rootView.releaseDateTextField.textField.text = dateFormatter.string(from: device.releaseDate ?? Date())
        
        rootView.deviceNumberTextField.textField.text = device.deviceNumber
        rootView.characteristicsTextField.textField.text = device.characteristics
        rootView.noteTextField.textField.text = device.note
        
        if let imageData = device.imageDeviceData, let image = UIImage(data: imageData) {
            rootView.photoPCImageView.contentMode = .scaleAspectFill
            rootView.photoPCImageView.image = image
        }
        
        if let serviceText = convertDaysToServiceText(from: device.serviceDays) {
            rootView.serviceTextField.textField.text = serviceText
        } else {
            rootView.serviceTextField.textField.text = "\(device.serviceDays) days"
        }
        
        if let cleanText = convertDaysToMemoryCleanText(from: device.cleanDays) {
            rootView.cleanTextField.textField.text = cleanText
        } else {
            rootView.cleanTextField.textField.text = "\(device.cleanDays) days"
        }
        
        if let memoryCleaningText = convertDaysToMemoryCleanText(from: device.memoryCleaningDays) {
            rootView.memoryCleaningTextField.textField.text = memoryCleaningText
        } else {
            rootView.memoryCleaningTextField.textField.text = "\(device.memoryCleaningDays) days"
        }
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
        
        rootView.saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
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
    
    @objc func saveButtonAction() {
        var updatedValues: [String: Any] = [:]

        if let type = rootView.typeTextField.textField.text {
            updatedValues["type"] = type
        }
        
        if let deviceName = rootView.deviceNameTextField.textField.text {
            updatedValues["deviceName"] = deviceName
        }
        
        if let deviceModel = rootView.modelTextField.textField.text {
            updatedValues["deviceModel"] = deviceModel
        }
        
        if let deviceNumber = rootView.deviceNumberTextField.textField.text {
            updatedValues["deviceNumber"] = deviceNumber
        }
        
        if let characteristics = rootView.characteristicsTextField.textField.text {
            updatedValues["characteristics"] = characteristics
        }
        
        if let note = rootView.noteTextField.textField.text {
            updatedValues["note"] = note
        }
        
        if let serviceDaysText = rootView.serviceTextField.textField.text,
           let serviceDays = convertServiceToDays(from: serviceDaysText) {
            updatedValues["serviceDays"] = serviceDays
        }
        
        if let cleanDaysText = rootView.cleanTextField.textField.text,
           let cleanDays = convertClenaAndMemoryToDays(from: cleanDaysText) {
            updatedValues["cleanDays"] = cleanDays
        }
        
        if let memoryCleaningDaysText = rootView.memoryCleaningTextField.textField.text,
           let memoryCleaningDays = convertClenaAndMemoryToDays(from: memoryCleaningDaysText) {
            updatedValues["memoryCleaningDays"] = memoryCleaningDays
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        if let releaseDateText = rootView.releaseDateTextField.textField.text,
           let releaseDate = dateFormatter.date(from: releaseDateText) {
            updatedValues["releaseDate"] = releaseDate
        }
        
        if let selectedImage = self.selectedImage,
           let imageData = selectedImage.pngData() {
            updatedValues["imageDeviceData"] = imageData
        }
        
        RealmManager.shared.updateDevice(device, withValues: updatedValues)
        
        print("Device updated with values: \(updatedValues)")
        navigationController?.popViewController(animated: true)
    }

    
    @objc func deleteButtonAction() {
        deleteDeviceAlert()
    }
}

extension EditVC: EditViewProtocol {
    func testFunc() {
        print("Hello! Enter your name.")
    }
    
    
}
