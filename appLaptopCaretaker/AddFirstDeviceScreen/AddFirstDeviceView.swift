import UIKit

class AddFirstDeviceView: UIView {
    
    let addFirstDeviceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 48, weight: .regular)
        $0.numberOfLines = 0
    }
    
    let typeTextField = CustomInputView(placeholder: "Type")
    
    let deviceNameTextField = CustomInputView(placeholder: "Device Name")
    
    let modelTextField = CustomInputView(placeholder: "Model")
    
    let releaseDateTextField = CustomInputView(placeholder: "Release Date")
    
    let deviceNumberTextField = CustomInputView(placeholder: "Device number (e.g for office, etc)")
    
    let characteristicsTextField = CustomInputView(placeholder: "Characteristics")
    
    let doneButton = CustomButton(title: "Done")
    
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
        addSubview(addFirstDeviceLabel)
        addSubview(typeTextField)
        addSubview(deviceNameTextField)
        addSubview(modelTextField)
        addSubview(releaseDateTextField)
        addSubview(deviceNumberTextField)
        addSubview(characteristicsTextField)
        addSubview(doneButton)
    }
    
    private func setupConstraints() {
        addFirstDeviceLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        typeTextField.snp.makeConstraints {
            $0.top.equalTo(addFirstDeviceLabel.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        deviceNameTextField.snp.makeConstraints {
            $0.top.equalTo(typeTextField.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        modelTextField.snp.makeConstraints {
            $0.top.equalTo(deviceNameTextField.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        releaseDateTextField.snp.makeConstraints {
            $0.top.equalTo(modelTextField.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        deviceNumberTextField.snp.makeConstraints {
            $0.top.equalTo(releaseDateTextField.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        characteristicsTextField.snp.makeConstraints {
            $0.top.equalTo(deviceNumberTextField.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        doneButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}

