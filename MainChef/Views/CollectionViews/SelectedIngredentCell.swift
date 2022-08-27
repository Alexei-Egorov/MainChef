import UIKit

class SelectedIngredentCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ingredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = UIColor(named: "PrimeOrange")
    }
    
    func setupCell(ingredient: IngredientModel) {
        ingredientLabel.text = ingredient.ingredientType.rawValue + " \(ingredient.quantity) \(ingredient.ingredientType.quantityType)"
    }

}
