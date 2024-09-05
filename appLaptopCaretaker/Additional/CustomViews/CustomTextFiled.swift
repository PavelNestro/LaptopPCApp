import UIKit

class CustomTextFiled: UIView, UITextFieldDelegate {

    var placeholder: String
    
    lazy var textField = UITextField().then {
        $0.backgroundColor = .mainGray
        $0.textColor = .black
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 22
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
        $0.placeholder = placeholder
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.delegate = self
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
    
    func configureTextFieldLeftView(image: UIImage?) {
        guard let image = image else { return }
        
        let icon = UIImageView(image: image)
        icon.contentMode = .scaleAspectFit
        icon.frame = CGRect(x: 0, y: 0, width: 24, height: 30)
        icon.tintColor = .black

        let paddingView = UIView(frame: CGRect(x: 34, y: 0, width: 10, height: 30))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 30))
        textField.rightView?.addSubview(icon)
        textField.rightView?.addSubview(paddingView)
        textField.rightViewMode = .always
    }
    
    func addSubviews() {
        addSubview(textField)
    }
    
    func makeConstraints() {
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
