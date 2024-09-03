import UIKit
import SnapKit

class AddNewDeviceView: UIView, UIGestureRecognizerDelegate {
    
    var buttonTappedHandler: (() -> Void)?
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let typeTextField = CustomInputView(placeholder: "Type").then {
        $0.configureTextFieldLeftView(image: UIImage(systemName: "chevron.down"))
    }
    
    let deviceNameTextField = CustomInputView(placeholder: "Device Name")
    
    let modelTextField = CustomInputView(placeholder: "Model")
    
    let releaseDateTextField = CustomInputView(placeholder: "Release Date").then {
        $0.configureTextFieldLeftView(image: UIImage(systemName: "calendar"))
    }
    
    let deviceNumberTextField = CustomInputView(placeholder: "Device number (e.g for office, etc)")
    
    let characteristicsTextField = CustomInputView(placeholder: "Characteristics")
    
    let noteTextField = CustomInputView(placeholder: "Note")
    
    let photoPCImageView = UIImageView().then {
        $0.backgroundColor = .mainGray
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .white
        $0.image = UIImage(systemName: "camera.fill")
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
    }
    
    
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(typeTextField)
        contentView.addSubview(deviceNameTextField)
        contentView.addSubview(modelTextField)
        contentView.addSubview(releaseDateTextField)
        contentView.addSubview(deviceNumberTextField)
        contentView.addSubview(characteristicsTextField)
        contentView.addSubview(noteTextField)
        contentView.addSubview(photoPCImageView)
        contentView.addSubview(doneButton)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalToSuperview()
        }
        
        typeTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        deviceNameTextField.snp.makeConstraints { make in
            make.top.equalTo(typeTextField.snp.bottom).offset(26)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        modelTextField.snp.makeConstraints { make in
            make.top.equalTo(deviceNameTextField.snp.bottom).offset(26)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        releaseDateTextField.snp.makeConstraints { make in
            make.top.equalTo(modelTextField.snp.bottom).offset(26)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        deviceNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(releaseDateTextField.snp.bottom).offset(26)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        characteristicsTextField.snp.makeConstraints { make in
            make.top.equalTo(deviceNumberTextField.snp.bottom).offset(26)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(90)
        }
        
        noteTextField.snp.makeConstraints { make in
            make.top.equalTo(characteristicsTextField.snp.bottom).offset(26)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        photoPCImageView.snp.makeConstraints { make in
            make.top.equalTo(noteTextField.snp.bottom).offset(26)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(photoPCImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
