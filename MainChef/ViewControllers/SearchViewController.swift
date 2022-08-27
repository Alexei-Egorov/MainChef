import UIKit
import CloudKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var headerBackgroundView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var ingredientsView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var selectedIngredientsScrollView: UIScrollView!
    
    //constraints
    @IBOutlet weak var contentSizeConstraint: NSLayoutConstraint!
    
    //indents
    let boxHorizontalIndent: CGFloat = 8  // расстояние между коробочками
    let boxVerticalIndent: CGFloat = 4
    let intrinsicBoxHorizontalIndent: CGFloat = 8  // расстояние между labal и границами boxа внутри коробочки
    let intrincisBoxVerticalIndent: CGFloat = 4
    
    let window = UIApplication.shared.windows.first
    lazy var gradientLayer = CAGradientLayer()
    
    var ingredients = ["Chicken", "Pasta", "Potatoes", "Banana", "Beef", "Broccoli", "Pork", "Eggs", "Lemon", "Cheese", "Fruit", "Peppers", "Salmon", "Seafood", "Chocolate", "Fish"]
    var selectedIngredients = [String]()
    var recipes = [RecipeModel]()
    
    let recipesRepository = RecipesRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DishCell", bundle: nil), forCellWithReuseIdentifier: "DishCell")
        
        downloadRecipes()
//        setupGradientLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        arrangeIngredientBoxes(ingredients: ingredients)
        contentSizeConstraint.constant = 600
    }
    
    func arrangeSelectedIngredients() {
        let yIndent: CGFloat = 8
        var currXPos: CGFloat = 8
        var lastXPos: CGFloat = 8  // крайняя точка для вычиследния длины contentView
        var contentWidth: CGFloat = view.frame.width
        
        for ingredient in selectedIngredients {
            let textLabel = UILabel()
            textLabel.text = ingredient
            textLabel.textColor = UIColor.white
            textLabel.font = UIFont(name: "SFProText-Semibold", size: 16)
            
            let labelSize = textLabel.intrinsicContentSize
            textLabel.frame = CGRect(x: 8, y: 4, width: labelSize.width, height: labelSize.height)
            
            let box = generateEngredientBox(with: textLabel, xCord: currXPos, yCord: yIndent,forIngredeints: false)
            contentView.addSubview(box)
            currXPos += labelSize.width + 16 + 8
            lastXPos += labelSize.width + 16
            if (contentWidth < lastXPos) {
                contentWidth = lastXPos + 8
                contentSizeConstraint.constant = contentWidth
            }
        }
    }
    
    func arrangeIngredientBoxes(ingredients: [String]) {
        let viewWidth = view.frame.width
        var residualWidthPoints = viewWidth - 8  // оставшееся место в линии
        var currentLine: CGFloat = 0
        var xCursor: CGFloat = 8

        for item in ingredients {
            let textLabel = UILabel()
            let xCoord: CGFloat
            let yCoord: CGFloat

            textLabel.text = item
            textLabel.textColor = UIColor.white
            textLabel.font = UIFont(name: "SFProText-Semibold", size: 16)

            let labelSize = textLabel.intrinsicContentSize
            let boxWidth: CGFloat = labelSize.width + boxHorizontalIndent * 2
            let boxHeight: CGFloat = labelSize.height + boxVerticalIndent * 2

            if (residualWidthPoints - (boxWidth + 8) < 0) {
                if (currentLine == 2) {
                    return
                }
                currentLine += 1
                residualWidthPoints = viewWidth - 8
                xCursor = 8
            }

            xCoord = xCursor
            yCoord = 8 + (boxHeight + 8) * currentLine

            residualWidthPoints -= (boxWidth + 8)
            xCursor += boxWidth + 8

            textLabel.frame = CGRect(x: 8, y: 4, width: labelSize.width, height: labelSize.height)

            let box = generateEngredientBox(with: textLabel, xCord: xCoord, yCord: yCoord, forIngredeints: true)

            ingredientsView.addSubview(box)
        }
    }
    
    func generateEngredientBox(with label: UILabel, xCord: CGFloat, yCord: CGFloat, forIngredeints: Bool) -> UIView {
        let tap: UITapGestureRecognizer
        
        if forIngredeints {
            tap = UITapGestureRecognizer(target: self, action: #selector(deleteElementFromIngredients(_:)))
        } else {
            tap = UITapGestureRecognizer(target: self, action: #selector(deleteElementFromSelected(_:)))
        }
        
        let labelSize = label.frame
        let returnView = UIView(frame: CGRect(x: xCord, y: yCord, width: labelSize.width + 16, height: labelSize.height + 8))

        returnView.translatesAutoresizingMaskIntoConstraints = false
        returnView.layer.cornerRadius = 10
        returnView.backgroundColor = UIColor(red: 252/255, green: 145/255, blue: 58/255, alpha: 1)
        returnView.addGestureRecognizer(tap)
        returnView.addSubview(label)

        return returnView
    }
    
    @objc func deleteElementFromIngredients(_ sender: UITapGestureRecognizer? = nil) {
        guard let sender = sender else { return }
        
        let our = sender.view?.subviews.first as? UILabel
        if let ingrName = our?.text {
            ingredients = ingredients.filter{ $0 != ingrName }  // просто удаляет элемент
            selectedIngredients.append(ingrName)
            
        }
        for view in ingredientsView.subviews {
            view.removeFromSuperview()
        }
        arrangeSelectedIngredients()
        arrangeIngredientBoxes(ingredients: ingredients)
    }
    
    @objc func deleteElementFromSelected(_ sender: UIGestureRecognizer? = nil) {
        guard let sender = sender else { return }
        
        let our = sender.view?.subviews.first as? UILabel
        if let ingName = our?.text {
            selectedIngredients = selectedIngredients.filter{ $0 != ingName }
            ingredients.append(ingName)
        }
        for view in contentView.subviews {
            view.removeFromSuperview()
        }
        arrangeSelectedIngredients()
        arrangeIngredientBoxes(ingredients: ingredients)
    }

//    func setupGradientLayer() {
//
//        gradientLayer.colors = [UIColor(red: 255/255, green: 78/255, blue: 80/255, alpha: 1.0).cgColor, UIColor(red: 249/255, green: 212/255, blue: 35/255, alpha: 1.0).cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)
//
//        headerView.layer.addSublayer(gradientLayer)
//    }
    
    private func downloadRecipes() {
        recipes = recipesRepository.loadRecipes()
        collectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishCell", for: indexPath) as! DishCell
        let recipe = recipes[indexPath.row]
        cell.dishImage.image = recipe.photo
        cell.dishNameLabel.text = recipe.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = RecipeDetailsViewController()
        show(viewController, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let padding: CGFloat = 6
        let edgeInset: CGFloat = 8
        
        let collectionViewWidth = collectionView.frame.width - (padding * (itemsPerRow - 1) + edgeInset * 2)
        let widthPerItem = collectionViewWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let itemsPerRow: CGFloat = 2
//        let padding: CGFloat = 6
//        let edgeInset: CGFloat = 8
//
//        let collectionViewWidth = collectionView.frame.width - (padding * (itemsPerRow - 1) + (edgeInset * 2))
//        let widthPerItem = collectionViewWidth / itemsPerRow
//
//        return CGSize(width: widthPerItem, height: widthPerItem)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(6)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
//    }
}


