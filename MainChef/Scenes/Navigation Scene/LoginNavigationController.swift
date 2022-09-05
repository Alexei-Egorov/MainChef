import UIKit

class LoginNavigationViewController: AppNavigationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = LoginViewController()
        show(vc, sender: nil)
    }
    
    
}
