
class WebGlossaryViewController: UIViewController {

    var rootView: WebGlossaryView {
        self.view as! WebGlossaryView
    }
    
    override func loadView() {
        self.view = WebGlossaryView()
    }
    
    let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.webView.load(URLRequest(url: url))
    }
}

import WebKit

class WebGlossaryView: UIView {
    
    let webView = WKWebView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        addSubview(webView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


