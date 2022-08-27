import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    func addKeyboardHideActionOnTap() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTap(sender:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.delegate = self
        view.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func singleTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view!.isKind(of: UIButton.self)) {
            view.endEditing(true)
            return false
        }
        return true
    }
}
