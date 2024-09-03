import UIKit

class SettingsSectionView: UIView {
    let shareAppButton = CustomSettingButton(title: "Share App").then {
        $0.chevronImage.isHidden = true
    }
    
    let rateAppButton = CustomSettingButton(title: "Rate App").then {
        $0.chevronImage.isHidden = true
    }
    
    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .mainGray
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(shareAppButton)
        addSubview(rateAppButton)
        addSubview(separatorLine)
        
        shareAppButton.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        separatorLine.snp.makeConstraints {
            $0.top.equalTo(shareAppButton.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.6)
        }
        
        rateAppButton.snp.makeConstraints {
            $0.top.equalTo(separatorLine.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
}
