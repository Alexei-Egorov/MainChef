import UIKit

class SplashScreenViewController: UIViewController, RootNavigationInterface {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("jopta cannot understand ")
        
        if CommonResources.shared.isUserLoggedIn {
            setCurrentViewController(MainNavigationViewController())
        } else {
            setCurrentViewController(LoginViewController())
        }
    }

    

}
