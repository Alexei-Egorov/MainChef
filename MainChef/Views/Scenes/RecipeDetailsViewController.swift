import UIKit

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsAndStages: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(recipeTitle: "koko")
    }
    
    private func setupNavigationBar(recipeTitle: String) {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        let title = NSAttributedString(string: recipeTitle, attributes: [NSAttributedString.Key.font : UIFont(name: "SFProText-Semibold", size: 18) ?? .systemFont(ofSize: 14)])
        titleLabel.attributedText = title
        navigationItem.titleView = titleLabel
    }

}
