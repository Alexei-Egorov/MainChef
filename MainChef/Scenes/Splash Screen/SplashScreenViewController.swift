import UIKit

class SplashScreenViewController: UIViewController, RootNavigationInterface {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if CommonResources.shared.isUserLoggedIn {
            setCurrentViewController(MainNavigationViewController())
        } else {
            setCurrentViewController(LoginViewController())
        }
    }

    

}
