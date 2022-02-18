import UIKit
import CloudKit

class SearchViewController: UIViewController, UICollectionViewDelegate {
    
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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var ingredients = ["Chicken", "Pasta", "Potatoes", "Banana", "Beef", "Broccoli", "Pork", "Eggs", "Lemon", "Cheese", "Fruit", "Peppers", "Salmon", "Seafood", "Chocolate", "Fish"]
    var selectedIngredients = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let safeAreainset = window?.safeAreaInsets.top ?? 48
        
//        let square = UIView(frame: CGRect(x: 400, y: 5, width: 50, height: 40))
//        square.backgroundColor = .orange
//
//        let square2 = UIView(frame: CGRect(x: 100, y: 5, width: 50, height: 40))
//        square2.backgroundColor = .orange
//
//        contentView.addSubview(square)
//        contentView.addSubview(square2)
        
        
//        setupGradientLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        arrangeIngredientBoxes(ingredients: ingredients)
        contentSizeConstraint.constant = 600
    }
    
    func createBoxes(from items: [String]) -> [UIView] {
        var returnLabels = [UIView]()
        
        for item in items {
            let textLabel = UILabel()
            textLabel.text = item
            textLabel.textColor = UIColor.white
            textLabel.font = UIFont(name: "SFProText-Semibold", size: 16)
            
            let labelSize = textLabel.intrinsicContentSize
            let boxWidth: CGFloat = labelSize.width + intrinsicBoxHorizontalIndent * 2
            let boxHeight: CGFloat = labelSize.height + intrincisBoxVerticalIndent * 2
            textLabel.frame = CGRect(x: 8, y: 4, width: labelSize.width, height: labelSize.height)
            
            let returnView = UIView()
            returnView.frame.size = CGSize(width: boxWidth, height: boxHeight)
            
            returnView.translatesAutoresizingMaskIntoConstraints = false
            returnView.layer.cornerRadius = 10
            returnView.backgroundColor = UIColor(red: 252/255, green: 145/255, blue: 58/255, alpha: 1)
//            returnView.addGestureRecognizer(tap)
            
            returnView.addSubview(textLabel)
            
            returnLabels.append(returnView)
        }
        
        return returnLabels
    }
    
    func arrangeIngredients(from: [UIView]) {
        let viewWidth = view.frame.width
        
        
    }
    
    func arrangeSelectedIngredients(from: [UIView]) {
        
    }
    
    // ingredientsView
    func arrangeIngredientBoxes(ingredients: [String]) {
        let viewWidth = view.frame.width
        var residualWidthPoints = viewWidth - 8  // оставшееся место в линии
        var currentLine: CGFloat = 0
        var xCursor: CGFloat = 8

        for item in ingredients {
            let textLabel = UILabel()
            let xCoord: CGFloat
            let yCoord: CGFloat

//            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.text = item
            textLabel.textColor = UIColor.white
            textLabel.font = UIFont(name: "SFProText-Semibold", size: 16)

            let labelSize = textLabel.intrinsicContentSize
//            textLabel.frame = CGRect(x: intrinsicBoxHorizontalIndent, y: intrincisBoxVerticalIndent, width: labelSize.width, height: labelSize.height)
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

            let box = generateEngredientBox(with: textLabel, xCord: xCoord, yCord: yCoord)

            ingredientsView.addSubview(box)
        }
    }
    
    func generateEngredientBox(with label: UILabel, xCord: CGFloat, yCord: CGFloat) -> UIView {

        let tap = UITapGestureRecognizer(target: self, action: #selector(deleteElement(_:)))

        let labelSize = label.frame

        let returnView = UIView(frame: CGRect(x: xCord, y: yCord, width: labelSize.width + 16, height: labelSize.height + 8))

        returnView.translatesAutoresizingMaskIntoConstraints = false
        returnView.layer.cornerRadius = 10
        returnView.backgroundColor = UIColor(red: 252/255, green: 145/255, blue: 58/255, alpha: 1)
        returnView.addGestureRecognizer(tap)

        returnView.addSubview(label)

        return returnView
    }
    
    @objc func deleteElement(_ sender: UITapGestureRecognizer? = nil) {
        guard let sender = sender else {
            return
        }
        let our = sender.view?.subviews.first as? UILabel
        if let ingrName = our?.text {
            ingredients = ingredients.filter{ $0 != ingrName }
        }
        for view in ingredientsView.subviews {
            view.removeFromSuperview()
        }
        arrangeIngredientBoxes(ingredients: ingredients)
    }
    
    //selectedIngredeintsView

//    func setupGradientLayer() {
//
//        gradientLayer.colors = [UIColor(red: 255/255, green: 78/255, blue: 80/255, alpha: 1.0).cgColor, UIColor(red: 249/255, green: 212/255, blue: 35/255, alpha: 1.0).cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)
//
//        headerView.layer.addSublayer(gradientLayer)
//    }
}
