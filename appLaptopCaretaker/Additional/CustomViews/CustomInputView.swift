import UIKit

class CustomInputView: UIView {

    var placeholder: String
    
    lazy var textField = UITextView().then {
        $0.backgroundColor = .mainGray
        $0.textColor = .black
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 22
        $0.textContainerInset = UIEdgeInsets(top: 11, left: 16, bottom: 0, right: 6)
        $0.addPlaceholder(placeholder)
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    init (placeholder: String) {
        self.placeholder = placeholder
        super.init(frame: .zero)
        setupView()
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
    }
    
    func makeConstraints() {
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
