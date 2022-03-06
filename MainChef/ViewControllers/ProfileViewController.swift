import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var createRecipeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCreateRecipeButton()
        self.navigationController?.isNavigationBarHidden = false
//        UINavigationBar.appearance().isHidden = false
    }
    
    func setupCreateRecipeButton() {
        createRecipeButton.backgroundColor = UIColor.clear
        createRecipeButton.setImage(UIImage(named: "addButtonIcon"), for: .normal)
    }
    
    @IBAction func createRecipeButtonTapped(_ sender: UIButton) {
    }

}
