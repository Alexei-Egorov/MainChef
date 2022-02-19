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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
