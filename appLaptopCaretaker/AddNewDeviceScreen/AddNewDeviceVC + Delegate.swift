import UIKit

extension AddNewDeviceVC: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            rootView.photoPCImageView.image = selectedImage
            rootView.photoPCImageView.contentMode = .scaleAspectFill
            device.imageDeviceData = selectedImage.toData()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
