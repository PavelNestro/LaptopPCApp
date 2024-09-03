import UIKit

extension UIColor {
    static let mainGray = UIColor(red255: 218, green255: 218, blue255: 218, alpha: 1)
    static let mainGreen = UIColor(red255: 226, green255: 255, blue255: 239, alpha: 1)
    static let mainPink = UIColor(red255: 248, green255: 229, blue255: 255, alpha: 1)
    static let mainOrange = UIColor(red255: 255, green255: 242, blue255: 226, alpha: 1)

    convenience init(red255: CGFloat, green255: CGFloat, blue255: CGFloat, alpha: CGFloat) {
        self.init(red: red255 / 255.0, green: green255 / 255.0, blue: blue255 / 255.0, alpha: alpha)
    }
}
