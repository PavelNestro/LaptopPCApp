import UIKit
import Then
import SnapKit

class WelcomeView: UIView {
    
    let welcomLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 48, weight: .regular)
        $0.numberOfLines = 0
        $0.text = "Hello!\nEnter your name."
    }
    
    let nameTextField = CustomTextFiled(placeholder: "Name")
    
    let nextButton = CustomButton(title: "Next")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(welcomLabel)
        addSubview(nameTextField)
        addSubview(nextButton)
    }
    
    private func setupConstraints() {
        welcomLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-100)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(welcomLabel.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        nextButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}

