import UIKit

class SearchViewController: UIViewController {

    let backgroundView = UIView()
    let boxHorizontalIndent: CGFloat = 8  //indent from UIView vertical edge to UILabel
    let boxVerticalIndent: CGFloat = 4
    let backViewHorizontalIndent: CGFloat = 8  //horizontal indent between elements
    let backViewVerticalIndent: CGFloat = 8  //vertical indent between elements
    
    let window = UIApplication.shared.windows.first
    
    var ingredients = ["Chicken", "Pasta", "Potatoes", "Banana", "Beef", "Broccoli", "Pork", "Eggs", "Lemon", "Cheese", "Fruit", "Peppers", "Salmon", "Seafood", "Chocolate", "Fish"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.frame = CGRect(x: 0, y: window?.safeAreaInsets.top ?? 44, width: view.frame.width, height: 114.5)
        backgroundView.backgroundColor = UIColor.systemIndigo
        
        view.addSubview(backgroundView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
            
            backgroundView.addSubview(box)
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
        for view in backgroundView.subviews {
            view.removeFromSuperview()
        }
        arrangeIngredientBoxes(ingredients: ingredients)
    }
}
