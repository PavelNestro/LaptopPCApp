import UIKit
extension UITextField {
    func setPlaceholder(_ text: String, color: UIColor) {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        self.attributedPlaceholder = attributedString
    }
}
