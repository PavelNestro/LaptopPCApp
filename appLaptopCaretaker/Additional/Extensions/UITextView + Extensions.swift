import UIKit

extension UITextView: UITextViewDelegate {
    func addPlaceholder(_ placeholder: String) {
        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.sizeToFit()
        placeholderLabel.font = self.font
        placeholderLabel.tag = 100
        placeholderLabel.isHidden = !self.text.isEmpty || self.isFirstResponder
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }

    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = !self.text.isEmpty || self.isFirstResponder
            placeholderLabel.sizeToFit()
            placeholderLabel.frame.origin = CGPoint(x: 16, y: self.textContainerInset.top)
        }
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        self.hidePlaceholder()
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        self.showPlaceholder()
    }
    
    private func hidePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = true
        }
    }
    
    private func showPlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = !self.text.isEmpty
        }
    }
}
