import UIKit

class CustomInputView: UIView {
    
    var placeholder: String
    
    lazy var textField = UITextView().then {
        $0.backgroundColor = .mainGray
        $0.textColor = .black
        $0.layer.borderColor = UIColor(red255: 2, green255: 29, blue255: 71, alpha: 0.18).cgColor
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.textContainerInset = UIEdgeInsets(top: 11, left: 16, bottom: 0, right: 6)
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }

     let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    init(placeholder: String) {
        self.placeholder = placeholder
        super.init(frame: .zero)
        setupView()
        placeholderLabel.text = placeholder
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .clear
        addSubviews()
        makeConstraints()
    }
    
    func addSubviews() {
        addSubview(textField)
        textField.addSubview(placeholderLabel)
    }
    
    func makeConstraints() {
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        placeholderLabel.snp.makeConstraints {
            $0.top.equalTo(textField.textContainerInset.top)
            $0.left.equalTo(textField.textContainerInset.left + 5) // отступы
        }
    }
    
    func checkPlaceholder() {
        placeholderLabel.isHidden = !textField.text.isEmpty
    }
}

extension CustomInputView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
