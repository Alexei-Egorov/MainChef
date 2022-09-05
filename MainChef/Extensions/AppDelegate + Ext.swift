import UIKit

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    var rootViewController: RootViewController? {
        if #available(iOS 13.0, *) {
            return (UIApplication.shared.connectedScenes.filter({$0.activationState != .unattached}).first?.delegate as? UIWindowSceneDelegate)?.window??.rootViewController as? RootViewController
        } else {
            return window?.rootViewController as? RootViewController
        }
    }
}
