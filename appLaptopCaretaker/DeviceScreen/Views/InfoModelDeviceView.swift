import UIKit

class InfoModelDeviceView: UIView {
    
    //MARK: - Views

    let modelLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.text = "Model:"
    }
    
    let modelDataLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .light)
        $0.textAlignment = .center
    }
    
    let realese = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.text = "Realese Date:"
    }
    
    let realeseDataLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .light)
        $0.textAlignment = .center
    }
    
    let deviceNumber = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.text = "Device Number:"
    }
    
    let deviceNumberDataLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .light)
        $0.textAlignment = .center
    }
    
    let characteristics = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.text = "Characteristics:"
    }
    
    let characteristicsView = UIView().then {
        $0.backgroundColor = .mainGray
        $0.layer.cornerRadius = 20
    }
    
    let characteristicsDataLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .light)
        $0.textAlignment = .left
    }
    
    let note = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.text = "Note:"
    }
    
    let noteView = UIView().then {
        $0.backgroundColor = .mainGray
        $0.layer.cornerRadius = 20
    }
    
    let noteDataLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .light)
        $0.textAlignment = .left
        $0.text = "You can add a note"
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
        backgroundColor = .clear
        addViews()
        makeConstraints()
    }
        
    //MARK: - public methods
    
    func configure(with device: Device) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        modelDataLabel.text = device.deviceModel
        realeseDataLabel.text = dateFormatter.string(from: device.releaseDate ?? Date())
        deviceNumberDataLabel.text = device.deviceNumber
        characteristicsDataLabel.text = device.characteristics.isEmpty == true ? "Characteristics" : device.characteristics
        noteDataLabel.text = device.note.isEmpty == true ? "Note" : device.note
    }

    func addViews() {
        let views = [modelLabel, modelDataLabel, realese, realeseDataLabel, deviceNumber, deviceNumberDataLabel, characteristics, characteristicsView, note, noteView]
        views.forEach {
            addSubview($0)
        }
        
        characteristicsView.addSubview(characteristicsDataLabel)
        noteView.addSubview(noteDataLabel)
    }
    
    func makeConstraints() {

        modelLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        modelDataLabel.snp.makeConstraints {
            $0.centerY.equalTo(modelLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        realese.snp.makeConstraints {
            $0.top.equalTo(modelLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        realeseDataLabel.snp.makeConstraints {
            $0.centerY.equalTo(realese.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        deviceNumber.snp.makeConstraints {
            $0.top.equalTo(realese.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        deviceNumberDataLabel.snp.makeConstraints {
            $0.centerY.equalTo(deviceNumber.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        characteristics.snp.makeConstraints {
            $0.top.equalTo(deviceNumber.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        characteristicsView.snp.makeConstraints {
            $0.top.equalTo(characteristics.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        characteristicsDataLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(11)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        note.snp.makeConstraints {
            $0.top.equalTo(characteristicsView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        noteView.snp.makeConstraints {
            $0.top.equalTo(note.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        noteDataLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(11)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}
