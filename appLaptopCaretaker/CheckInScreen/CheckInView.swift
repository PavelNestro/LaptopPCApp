import UIKit

class CheckInView: UIView {
    
    let typeOfCareLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.numberOfLines = 0
        $0.text = "Type of care:"
    }
    
    let typeOfCareTextField = CustomTextFiled(placeholder: "Type of care").then {
        $0.configureTextFieldLeftView(image: UIImage(systemName: "chevron.down"))
    }
    
    let addChekInButton = CustomButton(title: "Add Check-In")
    
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
        addSubview(typeOfCareLabel)
        addSubview(typeOfCareTextField)
        addSubview(addChekInButton)
    }
    
    private func setupConstraints() {
        typeOfCareLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        typeOfCareTextField.snp.makeConstraints {
            $0.top.equalTo(typeOfCareLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        addChekInButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}

