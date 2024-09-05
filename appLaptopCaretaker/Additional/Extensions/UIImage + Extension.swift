import UIKit

extension UIImage {
    func toData() -> Data? {
        return self.pngData()
    }

    static func fromData(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}
