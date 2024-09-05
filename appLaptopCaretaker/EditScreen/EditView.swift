import UIKit
import SnapKit

class EditView: UIView, UIGestureRecognizerDelegate {
    
    var buttonTappedHandler: (() -> Void)?
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let typeTextField = CustomTextFiled(placeholder: "Type").then {
        $0.configureTextFieldLeftView(image: UIImage(systemName: "chevron.down"))
    }
    
    let deviceNameTextField = CustomTextFiled(placeholder: "Device Name")

    let modelTextField = CustomTextFiled(placeholder: "Model")
    
    let releaseDateTextField = CustomTextFiled(placeholder: "Release Date").then {
        $0.configureTextFieldLeftView(image: UIImage(systemName: "calendar"))
    }
    
    let deviceNumberTextField = CustomTextFiled(placeholder: "Device number (e.g for office, etc)")
    
    let characteristicsTextField = CustomTextFiled(placeholder: "Characteristics")
    
    let noteTextField = CustomTextFiled(placeholder: "Note")
    
    let photoPCImageView = UIImageView().then {
        $0.backgroundColor = .mainGray
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .white
        $0.image = UIImage(systemName: "camera.fill")
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
    }
    
    let careIntervalsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.numberOfLines = 0
        $0.text = "Care Intervals"
    }
    
    let serviceLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .left
        $0.text = "Service"
    }
    
    let serviceTextField = CustomTextFiled(placeholder: "Every 365 days").then {
        $0.configureTextFieldLeftView(image: UIImage(systemName: "chevron.down"))
    }
    
    let cleanLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .left
        $0.text = "Clean"
    }
    
    let cleanTextField = CustomTextFiled(placeholder: "Every 5 days").then {
        $0.configureTextFieldLeftView(image: UIImage(systemName: "chevron.down"))
    }
    
    let memoryCleaning = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .left
        $0.text = "Memory cleaning"
    }
    
    let memoryCleaningTextField = CustomTextFiled(placeholder: "Every 5 days").then {
        $0.configureTextFieldLeftView(image: UIImage(systemName: "chevron.down"))
    }
    
    let saveButton = CustomButton(title: "Save")
    
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
        setupGestureRecognizers()
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
        contentView.addSubview(careIntervalsLabel)
        contentView.addSubview(serviceLabel)
        contentView.addSubview(serviceTextField)
        contentView.addSubview(cleanLabel)
        contentView.addSubview(cleanTextField)
        contentView.addSubview(memoryCleaning)
        contentView.addSubview(memoryCleaningTextField)
        contentView.addSubview(saveButton)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalToSuperview()
        }
        
        typeTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        deviceNameTextField.snp.makeConstraints {
            $0.top.equalTo(typeTextField.snp.bottom).offset(26)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        modelTextField.snp.makeConstraints {
            $0.top.equalTo(deviceNameTextField.snp.bottom).offset(26)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        releaseDateTextField.snp.makeConstraints {
            $0.top.equalTo(modelTextField.snp.bottom).offset(26)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        deviceNumberTextField.snp.makeConstraints {
            $0.top.equalTo(releaseDateTextField.snp.bottom).offset(26)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        characteristicsTextField.snp.makeConstraints {
            $0.top.equalTo(deviceNumberTextField.snp.bottom).offset(26)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        noteTextField.snp.makeConstraints {
            $0.top.equalTo(characteristicsTextField.snp.bottom).offset(26)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        photoPCImageView.snp.makeConstraints {
            $0.top.equalTo(noteTextField.snp.bottom).offset(26)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(200)
        }
        
        careIntervalsLabel.snp.makeConstraints {
            $0.top.equalTo(photoPCImageView.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        serviceLabel.snp.makeConstraints {
            $0.top.equalTo(careIntervalsLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        serviceTextField.snp.makeConstraints {
            $0.top.equalTo(serviceLabel.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        cleanLabel.snp.makeConstraints {
            $0.top.equalTo(serviceTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        cleanTextField.snp.makeConstraints {
            $0.top.equalTo(cleanLabel.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        memoryCleaning.snp.makeConstraints {
            $0.top.equalTo(cleanTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        memoryCleaningTextField.snp.makeConstraints {
            $0.top.equalTo(memoryCleaning.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(memoryCleaningTextField.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func setupGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        tapGesture.delegate = self
        photoPCImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func buttonTapped(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                           gesture.view?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       }) { (_) in
            UIView.animate(withDuration: 0.1,
                           animations: {
                               gesture.view?.transform = CGAffineTransform.identity
                           },
                           completion: { _ in
                               self.buttonTappedHandler?()
                           })
        }
    }
}
