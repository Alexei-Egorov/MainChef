import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var createPasswordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    
    let userRepository = UserRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text!
        let email = usernameTextField.text!
        let createdPassword = createPasswordTextField.text!
        let repeatedPassword = repeatPasswordTextField.text!
        guard !username.isEmpty, !email.isEmpty, !createdPassword.isEmpty, !repeatedPassword.isEmpty else { return }
        guard createdPassword == repeatedPassword else { return }
        
        let user = UserModel(id: UUID().uuidString, name: "", surname: "", username: username, email: email, password: createdPassword, photo: UIImage(), cookbooks: [], shoppingList: [])
        userRepository.createUser(user: user)
        CommonResources.shared.logedInUser = user
        Helper.login()
    }
    

}
