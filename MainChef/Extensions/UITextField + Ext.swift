import UIKit

extension UITextField {
    
    func setupAsCustomTextField() {
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 7
        self.layer.borderColor = UIColor(named: "PrimeOrange")?.cgColor
        self.layer.masksToBounds = true
    }
}
