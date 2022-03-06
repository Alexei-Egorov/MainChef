import UIKit

extension UIView {
    
    func applyGradient(colors: [UIColor], locations: (st: CGPoint, end: CGPoint), cornerRadius: CGFloat = 0) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = locations.st
        gradient.endPoint = locations.end
        gradient.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
