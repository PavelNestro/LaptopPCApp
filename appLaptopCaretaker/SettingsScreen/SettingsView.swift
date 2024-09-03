import UIKit
import SnapKit

class SettingsView: UIView {
    
    let editNameButton = CustomSettingButton(title: "Edit Name")
    
    let privacyPolicyButton = CustomSettingButton(title: "Privacy Policy")
    
    let settingsSectionView = SettingsSectionView()
    
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
        addSubview(editNameButton)
        addSubview(privacyPolicyButton)
        addSubview(settingsSectionView)
    }
    
    private func setupConstraints() {
        editNameButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        privacyPolicyButton.snp.makeConstraints {
            $0.top.equalTo(editNameButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        settingsSectionView.snp.makeConstraints {
            $0.top.equalTo(privacyPolicyButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}
