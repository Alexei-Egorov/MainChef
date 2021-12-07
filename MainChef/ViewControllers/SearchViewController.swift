import UIKit

class SearchViewController: UIViewController {

    let contentView = UIView()
    let headerView = UIView()
    let boxHorizontalIndent: CGFloat = 8  //indent from UIView vertical edge to UILabel
    let boxVerticalIndent: CGFloat = 4
    let backViewHorizontalIndent: CGFloat = 8  //horizontal indent between elements
    let backViewVerticalIndent: CGFloat = 8  //vertical indent between elements
    
    let window = UIApplication.shared.windows.first
    lazy var gradientLayer = CAGradientLayer()
    
    var searchBar = UISearchBar()
    
    var ingredients = ["Chicken", "Pasta", "Potatoes", "Banana", "Beef", "Broccoli", "Pork", "Eggs", "Lemon", "Cheese", "Fruit", "Peppers", "Salmon", "Seafood", "Chocolate", "Fish"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let safeAreainset = window?.safeAreaInsets.top ?? 44
        searchBar.frame = CGRect(x: 0, y: safeAreainset, width: view.frame.width, height: 50)
        
        let img = UIImage()
        searchBar.backgroundImage = img
        searchBar.barTintColor = UIColor.clear
        
        contentView.frame = CGRect(x: 0, y: safeAreainset + 50, width: view.frame.width, height: 114.5)
        contentView.backgroundColor = UIColor.clear
        
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: safeAreainset + 164.5)
        
        setupGradientLayer()
        
        headerView.addSubview(searchBar)
        headerView.addSubview(contentView)
        
        view.addSubview(headerView)
//        view.addSubview(contentView)
//        view.addSubview(searchBar)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = headerView.bounds
        arrangeIngredientBoxes(ingredients: ingredients)
    }
    
    func arrangeIngredientBoxes(ingredients: [String]) {
        let viewWidth = view.frame.width
        var residualWidthPoints = viewWidth - 8  //берём во внимание левый отступ
        var currentLine: CGFloat = 0
        var xCursor: CGFloat = 8
        
        for item in ingredients {
            let textLabel = UILabel()
            let xCoord: CGFloat
            let yCoord: CGFloat
            
            textLabel.translatesAutoresizingMaskIntoConstraints = false
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
            
            let box = genereteEngredientBox(with: textLabel, xCord: xCoord, yCord: yCoord)
            
            contentView.addSubview(box)
        }
    }
    
    func genereteEngredientBox(with label: UILabel, xCord: CGFloat, yCord: CGFloat) -> UIView {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(deleteElement(_:)))
        
//        print("Text label height: \(labelSize.height)")
//        print("Family names: \(UIFont.familyNames)")
//        print("Font names for SFProText: \(UIFont.fontNames(forFamilyName: "SF Pro Text"))")
        
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
        for view in contentView.subviews {
            view.removeFromSuperview()
        }
        arrangeIngredientBoxes(ingredients: ingredients)
    }
    
    
    //MARK: - Additional viewSetup supporting functions
    func setupGradientLayer() {
        
        gradientLayer.colors = [UIColor(red: 255/255, green: 78/255, blue: 80/255, alpha: 1.0).cgColor, UIColor(red: 249/255, green: 212/255, blue: 35/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)
        
        headerView.layer.addSublayer(gradientLayer)
    }
}
