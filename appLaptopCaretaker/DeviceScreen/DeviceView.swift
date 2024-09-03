import UIKit

class DeviceView: UIView {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let nameDeviceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.numberOfLines = 0
        $0.text = "MacBook Pro M2"
    }
    
    let photoPCImageView = UIImageView().then {
        $0.backgroundColor = .mainGray
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .white
        $0.image = UIImage(systemName: "camera.fill")
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
    }
    
    let infoCleanDeviceView = InfoCleanDeviceView().then {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    let chekInButton = CustomButton(title: "Check-In").then {
        $0.backgroundColor = .mainOrange
    }
    
    let infoModelDeviceView = InfoModelDeviceView()
    
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
        contentView.addSubview(nameDeviceLabel)
        contentView.addSubview(photoPCImageView)
        contentView.addSubview(infoCleanDeviceView)
        contentView.addSubview(chekInButton)
        contentView.addSubview(infoModelDeviceView)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        nameDeviceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        photoPCImageView.snp.makeConstraints {
            $0.top.equalTo(nameDeviceLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(200)
        }
        
        infoCleanDeviceView.snp.makeConstraints {
            $0.top.equalTo(photoPCImageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        chekInButton.snp.makeConstraints {
            $0.top.equalTo(infoCleanDeviceView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        infoModelDeviceView.snp.makeConstraints {
            $0.top.equalTo(chekInButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
}
