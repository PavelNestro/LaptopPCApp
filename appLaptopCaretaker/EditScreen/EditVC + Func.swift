import UIKit

//MARK: - UIImagePickerControllerDelegate
extension EditVC: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            self.selectedImage = selectedImage
            rootView.photoPCImageView.image = selectedImage
            rootView.photoPCImageView.contentMode = .scaleAspectFill
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


//MARK: - extension EditVC
extension EditVC {
    @objc func typeTextFieldTapped() {
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
    
    func deleteDeviceAlert() {
        let alertController = UIAlertController(title: "Delete device?", message: nil, preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { _ in
            RealmManager.shared.deleteDevice(self.device)
            self.presenter.toMyDevicesScreen()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        rootView.releaseDateTextField.textField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func serviceTextFieldAction() {
        let alertController = UIAlertController(title: "Select Service Type", message: nil, preferredStyle: .actionSheet)
        
        let everyOneYear = UIAlertAction(title: "365 days", style: .default) { _ in
            self.rootView.serviceTextField.textField.text = "365 days"
        }
        
        let oneHundredEighty = UIAlertAction(title: "180 days", style: .default) { _ in
            self.rootView.serviceTextField.textField.text = "180 days"
        }
        
        let ninetyDays = UIAlertAction(title: "90 days", style: .default) { _ in
            self.rootView.serviceTextField.textField.text = "90 days"
        }
        
        let sixtyDays = UIAlertAction(title: "60 days", style: .default) { _ in
            self.rootView.serviceTextField.textField.text = "60 days"
        }
        
        let thirtyDays = UIAlertAction(title: "30 days", style: .default) { _ in
            self.rootView.serviceTextField.textField.text = "30 days"
        }
        
        let twoWeeks = UIAlertAction(title: "2 weeks", style: .default) { _ in
            self.rootView.serviceTextField.textField.text = "2 weeks"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(everyOneYear)
        alertController.addAction(oneHundredEighty)
        alertController.addAction(ninetyDays)
        alertController.addAction(sixtyDays)
        alertController.addAction(thirtyDays)
        alertController.addAction(twoWeeks)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func cleanTextFieldAction() {
        let alertController = UIAlertController(title: "Select Cleaning Days", message: nil, preferredStyle: .actionSheet)
        
        let ninetyDays = UIAlertAction(title: "90 days", style: .default) { _ in
            self.rootView.cleanTextField.textField.text = "90 days"
        }
        
        let sixtyDays = UIAlertAction(title: "60 days", style: .default) { _ in
            self.rootView.cleanTextField.textField.text = "60 days"
        }
        
        let thirtyDays = UIAlertAction(title: "30 days", style: .default) { _ in
            self.rootView.cleanTextField.textField.text = "30 days"
        }
        
        let twoWeeks = UIAlertAction(title: "2 weeks", style: .default) { _ in
            self.rootView.cleanTextField.textField.text = "2 weeks"
        }
        
        let fiveDay = UIAlertAction(title: "5 days", style: .default) { _ in
            self.rootView.cleanTextField.textField.text = "5 days"
        }
        
        let threeDay = UIAlertAction(title: "3 days", style: .default) { _ in
            self.rootView.cleanTextField.textField.text = "3 days"
        }
        
        let everyDay = UIAlertAction(title: "every day", style: .default) { _ in
            self.rootView.cleanTextField.textField.text = "every day"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(ninetyDays)
        alertController.addAction(sixtyDays)
        alertController.addAction(thirtyDays)
        alertController.addAction(twoWeeks)
        alertController.addAction(fiveDay)
        alertController.addAction(threeDay)
        alertController.addAction(everyDay)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func memoryTextFieldAction() {
        let alertController = UIAlertController(title: "Select Memory cleaning Days", message: nil, preferredStyle: .actionSheet)
        
        let ninetyDays = UIAlertAction(title: "90 days", style: .default) { _ in
            self.rootView.memoryCleaningTextField.textField.text = "90 days"
        }
        
        let sixtyDays = UIAlertAction(title: "60 days", style: .default) { _ in
            self.rootView.memoryCleaningTextField.textField.text = "60 days"
        }
        
        let thirtyDays = UIAlertAction(title: "30 days", style: .default) { _ in
            self.rootView.memoryCleaningTextField.textField.text = "30 days"
        }
        
        let twoWeeks = UIAlertAction(title: "2 weeks", style: .default) { _ in
            self.rootView.memoryCleaningTextField.textField.text = "2 weeks"
        }
        
        let fiveDay = UIAlertAction(title: "5 days", style: .default) { _ in
            self.rootView.memoryCleaningTextField.textField.text = "5 days"
        }
        
        let threeDay = UIAlertAction(title: "3 days", style: .default) { _ in
            self.rootView.memoryCleaningTextField.textField.text = "3 days"
        }
        
        let everyDay = UIAlertAction(title: "every day", style: .default) { _ in
            self.rootView.memoryCleaningTextField.textField.text = "every day"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(ninetyDays)
        alertController.addAction(sixtyDays)
        alertController.addAction(thirtyDays)
        alertController.addAction(twoWeeks)
        alertController.addAction(fiveDay)
        alertController.addAction(threeDay)
        alertController.addAction(everyDay)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func convertClenaAndMemoryToDays(from text: String) -> Int? {
        let conversionTable: [String: Int] = [
            "90 days": 90,
            "60 days": 60,
            "30 days": 30,
            "2 weeks": 14,
            "5 days": 5,
            "3 days": 3,
            "every day": 1
        ]
        
        return conversionTable[text]
    }
    
    func convertServiceToDays(from text: String) -> Int? {
        let conversionTable: [String: Int] = [
            "365 days": 365,
            "180 days": 180,
            "90 days": 90,
            "60 days": 60,
            "30 days": 30,
            "2 weeks": 14
        ]
        
        return conversionTable[text]
    }
    
    func convertDaysToMemoryCleanText(from days: Int) -> String? {
        let conversionTable: [Int: String] = [
            90: "90 days",
            60: "60 days",
            30: "30 days",
            14: "2 weeks",
            5: "5 days",
            3: "3 days",
            1: "every day"
        ]
        
        return conversionTable[days]
    }

    func convertDaysToServiceText(from days: Int) -> String? {
        let conversionTable: [Int: String] = [
            365: "365 days",
            180: "180 days",
            90: "90 days",
            60: "60 days",
            30: "30 days",
            14: "2 weeks"
        ]
        
        return conversionTable[days]
    }
}
