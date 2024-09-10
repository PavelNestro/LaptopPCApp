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
    
    func configure(with device: Device) {
        nameLabel.text = device.deviceName
        let currentDate = Date()
        let daysSinceServiceLastCheckIn = Calendar.current.dateComponents([.day], from: device.lastCheckServiceInDate, to: currentDate).day ?? 0
        let daysSinceCleanLastCheckIn = Calendar.current.dateComponents([.day], from: device.lastCheckCleanInDate, to: currentDate).day ?? 0
        let daysSinceMemoryCleanLastCheckIn = Calendar.current.dateComponents([.day], from: device.lastCheckMemoryCleanInDate, to: currentDate).day ?? 0
        
        
        let remainingServiceDays = max(device.serviceDays - daysSinceServiceLastCheckIn, 0)
        let remainingCleanDays = max(device.cleanDays - daysSinceCleanLastCheckIn, 0)
        let remainingMemoryCleaningDays = max(device.memoryCleaningDays - daysSinceMemoryCleanLastCheckIn, 0)
        serviceDaysDataLabel.text = remainingServiceDays == 0 ? "Need!" : "\(remainingServiceDays) days"
        cleanDaysDataLabel.text = remainingCleanDays == 0 ? "Need!" : "\(remainingCleanDays) days"
        memoryClearingDataLabel.text = remainingMemoryCleaningDays == 0 ? "Need!" : "\(remainingMemoryCleaningDays) days"

        
        switch device.type {
        case "Laptop":
            mainContentView.backgroundColor = .mainGreen
        case "PC":
            mainContentView.backgroundColor = .mainOrange
        default:
            mainContentView.backgroundColor = UIColor.gray
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
    
    override func prepareForReuse() {
        nameLabel.text = nil
        serviceDaysDataLabel.text = nil
        cleanDaysDataLabel.text = nil
        memoryClearingDataLabel.text = nil
    }
}
