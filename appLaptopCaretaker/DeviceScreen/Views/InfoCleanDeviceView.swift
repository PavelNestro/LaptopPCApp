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
    
    func configure(with device: Device) {

        if let serviceText = convertDaysToServiceText(from: device.serviceDays) {
            serviceDaysDataLabel.text = serviceText
        } else {
            serviceDaysDataLabel.text = "\(device.serviceDays) days"
        }

        if let cleanText = convertDaysToMemoryAndClenText(from: device.cleanDays) {
            cleanDaysDataLabel.text = cleanText
        } else {
            cleanDaysDataLabel.text = "\(device.cleanDays) days"
        }

        if let memoryCleaningText = convertDaysToMemoryAndClenText(from: device.memoryCleaningDays) {
            memoryClearingDataLabel.text = memoryCleaningText
        } else {
            memoryClearingDataLabel.text = "\(device.memoryCleaningDays) days"
        }
        
        switch device.type {
        case "Laptop":
            backgroundColor = .mainGreen
        case "PC":
            backgroundColor = .mainOrange
        default:
            backgroundColor = UIColor.gray
        }
    }
    
    func convertDaysToMemoryAndClenText(from days: Int) -> String? {
        let conversionTable: [Int: String] = [
            90: "90 days",
            60: "60 days",
            30: "30 days",
            14: "2 weeks",
            5: "5 days",
            3: "3 days",
            1: "every day"
        ]
        
        return conversionTable[days]
    }

    func convertDaysToServiceText(from days: Int) -> String? {
        let conversionTable: [Int: String] = [
            365: "365 days",
            180: "180 days",
            90: "90 days",
            60: "60 days",
            30: "30 days",
            14: "2 weeks"
        ]
        
        return conversionTable[days]
    }

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
