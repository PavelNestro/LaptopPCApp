import UIKit

class MyDeviceViewCell: UITableViewCell {
    
    static let identificator  = "MyDeviceViewCell"
    
    //MARK: - Views
    
    let mainContentView = UIView().then {
        $0.backgroundColor = .mainGreen
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    let nameLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.textAlignment = .center
        $0.text = "MacBook Pro M2:"
    }
    
    let serviceDaysLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.text = "Service:"
    }
    
    let serviceDaysDataLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
    }
    
    let cleanDays = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.text = "Clean:"
    }
    
    let cleanDaysDataLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
    }
    
    let memoryClearingDays = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.text = "Memory clearing:"
    }
    
    let memoryClearingDataLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
    }
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        addViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setupView()
        makeConstraints()
    }
        
    //MARK: - public methods
    
    func configure(with model: Device) {
        nameLabel.text = model.name
        serviceDaysDataLabel.text = "\(model.serviceDays) days"
        cleanDaysDataLabel.text = "\(model.cleanDays) days"
        memoryClearingDataLabel.text = "\(model.memoryClearingDays) day"
        
        switch model.type {
        case "laptop":
            mainContentView.backgroundColor = .mainGreen
        case "PC":
            mainContentView.backgroundColor = .mainOrange
        default:
            mainContentView.backgroundColor = UIColor.gray
        }
    }

    func addViews() {
        contentView.addSubview(mainContentView)
        let views = [nameLabel, serviceDaysLabel, serviceDaysDataLabel, cleanDays, cleanDaysDataLabel, memoryClearingDays, memoryClearingDataLabel]
        views.forEach {
            mainContentView.addSubview($0)
        }
    }
    
    func setupView() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 15
        let clearView = UIView()
        clearView.backgroundColor = .clear
        selectedBackgroundView = clearView
    }
    
    func makeConstraints() {
        mainContentView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(4)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        serviceDaysLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        serviceDaysDataLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        cleanDays.snp.makeConstraints {
            $0.top.equalTo(serviceDaysLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        cleanDaysDataLabel.snp.makeConstraints {
            $0.top.equalTo(serviceDaysDataLabel.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        memoryClearingDays.snp.makeConstraints {
            $0.top.equalTo(cleanDays.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        memoryClearingDataLabel.snp.makeConstraints {
            $0.top.equalTo(cleanDaysDataLabel.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}

private extension MyDeviceViewCell {
    enum Constants {
        static let iconImage: UIImage = UIImage(systemName: "square.stack") ?? UIImage()
        static let priceLabel: String = "Стоимость"
        static let minCoverageLabel: String = "Мин. охват"
        static let maxCoverageLabel: String = "Макс. охват"
        static let garantCoverageLabel: String = "Гарант. охват"
        static let caseFailureLabel: String = "В случае невыполнения"
    }
}
