import UIKit

class InfoCleanDeviceView: UIView {
    
    //MARK: - Views

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .mainOrange
        addViews()
        makeConstraints()
    }
        
    //MARK: - public methods
    
    func configure(with model: Device) {
        serviceDaysDataLabel.text = "\(model.serviceDays) days"
        cleanDaysDataLabel.text = "\(model.cleanDays) days"
        memoryClearingDataLabel.text = "\(model.memoryClearingDays) day"
    }
    
    func configurePostType(_ postValue: String) {
        switch postValue {
        case "i-post":
            backgroundColor = UIColor(red255: 255, green255: 239, blue255: 208, alpha: 1)
        case "i-reals":
            backgroundColor = UIColor(red255: 216, green255: 243, blue255: 255, alpha: 1)
        case "i-battle":
            backgroundColor = UIColor(red255: 255, green255: 213, blue255: 236, alpha: 1)
        case "i-mockup":
            backgroundColor = UIColor(red255: 247, green255: 213, blue255: 255, alpha: 1)
        case "i-integration":
            backgroundColor = UIColor(red255: 226, green255: 213, blue255: 255, alpha: 1)
        case "i-collaboration":
            backgroundColor = UIColor(red255: 213, green255: 222, blue255: 255, alpha: 1)
        case "i-broadcast":
            backgroundColor = UIColor(red255: 255, green255: 213, blue255: 213, alpha: 1)
        case "t-post-with-photo":
            backgroundColor = UIColor(red255: 213, green255: 255, blue255: 230, alpha: 1)
        case "t-post-without-photo":
            backgroundColor = UIColor(red255: 231, green255: 255, blue255: 213, alpha: 1)
        case "t-broadcast":
            backgroundColor = UIColor(red255: 213, green255: 255, blue255: 255, alpha: 1)
        default:
            backgroundColor = UIColor(red255: 213, green255: 255, blue255: 255, alpha: 1)
        }
    } // добавить для каждоай ячейки свой цвет !!!!

    func addViews() {
        let views = [serviceDaysLabel, serviceDaysDataLabel, cleanDays, cleanDaysDataLabel, memoryClearingDays, memoryClearingDataLabel]
        views.forEach {
            addSubview($0)
        }
    }
    
    func makeConstraints() {

        serviceDaysLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        serviceDaysDataLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
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
