import UIKit

class CustomSettingButton: UIButton {
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    let chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = UIColor(red: 0.01, green: 0.11, blue: 0.28, alpha: 0.48)
        return imageView
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        label.text = title
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(label)
        addSubview(chevronImage)
        
        backgroundColor = .mainGray
        clipsToBounds = true
        layer.cornerRadius = 10
        
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        chevronImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(18)
            $0.width.equalTo(11)
        }
    }
}
