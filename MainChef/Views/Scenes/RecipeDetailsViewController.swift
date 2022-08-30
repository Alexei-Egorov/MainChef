import UIKit

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftIngredientsView: UIView!
    @IBOutlet weak var rightIngredientsView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var leftIngredientsViewHeightConstraint: NSLayoutConstraint!
    
    private var viewModel: RecipeDetailsViewModel!
    
    convenience init(viewModel: RecipeDetailsViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RecipeStageCell", bundle: .main), forCellReuseIdentifier: "RecipeStageCell")

        setupNavigationBar(recipeTitle: viewModel.recipe.name)
        setupView(with: viewModel.recipe)
    }
    
    private func setupNavigationBar(recipeTitle: String) {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        let title = NSAttributedString(string: recipeTitle, attributes: [NSAttributedString.Key.font : UIFont(name: "SFProText-Semibold", size: 18) ?? .systemFont(ofSize: 14)])
        titleLabel.attributedText = title
        navigationItem.titleView = titleLabel
    }
    
    private func setupView(with model: RecipeModel) {
        imageView.image = model.photo
        descriptionLabel.text = model.description
        setupIngredientsViews(ingredients: model.ingredients)
    }
    
    private func setupIngredientsViews(ingredients: [IngredientModel]) {
        let middle = ingredients.count / 2
        var viewHeight = 0
        for i in 0..<ingredients.count {
            let targetView = i < middle ? leftIngredientsView : rightIngredientsView
            var y = 5
            if i == middle {
                viewHeight = y + 25
                y = 5
            }
            
            let label = UILabel()
            label.text = "· \(ingredients[i].ingredientType.rawValue) \(ingredients[i].quantity)\(ingredients[i].ingredientType.quantityType)"
            label.font = UIFont(name: "SFProText-Semibold", size: 16)
            
            let labelSize = label.intrinsicContentSize
            let serial = i < middle ? i : i - middle
            y += (Int(labelSize.height) + 2) * serial
            
            print("jopta height: \(labelSize.height)")
            
            label.frame = CGRect(x: 6, y: y, width: Int(labelSize.width)+1, height: Int(labelSize.height))
            targetView?.addSubview(label)
        }
        leftIngredientsViewHeightConstraint.constant = CGFloat(viewHeight)
    }

    
}

extension RecipeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipe.stages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeStageCell") as! RecipeStageCell
        cell.stageLabel.text = "Stage \(indexPath.row + 1)"
        cell.descriptionTextField.text = viewModel.recipe.stages[indexPath.row]
        cell.descriptionTextField.isEnabled = false
        return cell
    }
}
