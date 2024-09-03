import UIKit

class MyDevicesView: UIView, UIGestureRecognizerDelegate {
    
    var buttonTappedHandler: (() -> Void)?
    
    let greetingsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 34, weight: .medium)
        $0.numberOfLines = 0
    }
    
    let tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.register(MyDeviceViewCell.self, forCellReuseIdentifier: MyDeviceViewCell.identificator)
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }

    let footerImageView = UIImageView().then {
        $0.image = UIImage(named: "button")
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
    }
    
    let addYourFirsDeviceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 34, weight: .medium)
        $0.numberOfLines = 0
        $0.textColor = .gray
        $0.contentMode = .center
    }
    
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
        setupFooterView()
        setupGestureRecognizers()
    }
    
    private func addSubviews() {
        addSubview(greetingsLabel)
        addSubview(tableView)
        addSubview(addYourFirsDeviceLabel)
    }
    
    private func setupConstraints() {
        greetingsLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(greetingsLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        addYourFirsDeviceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setupFooterView() {
        footerImageView.frame = CGRect(x: 0, y: 0, width: 400, height: 83)
        tableView.tableFooterView = footerImageView
    }
    
    func setupGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        tapGesture.delegate = self
        footerImageView.addGestureRecognizer(tapGesture)
   }
    
    @objc func buttonTapped(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                           gesture.view?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       }) { (_) in
            UIView.animate(withDuration: 0.1,
                           animations: {
                               gesture.view?.transform = CGAffineTransform.identity
                           },
                           completion: { _ in
                               self.buttonTappedHandler?()
                           })
        }
    }
}

