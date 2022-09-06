import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    let userRepository = UserRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        guard !email.isEmpty && !password.isEmpty else { return }
        if let gotUser = userRepository.getUser(email: emailTextField.text!) {
            CommonResources.shared.logedInUser = gotUser
            Helper.login()
        } else {
            print("jopta didn't find any user")
            return
        }
    }
    

}
