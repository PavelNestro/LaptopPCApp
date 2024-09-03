
import UIKit

class CustomButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        setupButton()
        setTitle(title, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupButton()
    }
    
    func setupButton() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        clipsToBounds = true
        layer.cornerRadius = 20
        snp.makeConstraints { $0.height.equalTo(41) }
    }
}
