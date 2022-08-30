import UIKit

class DishCell: UICollectionViewCell {

    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dishImage.layer.cornerRadius = 12
        dishImage.layer.masksToBounds = true
    }

    func setupCell(with model: RecipeModel) {
        dishNameLabel.text = model.name
        dishImage.image = model.photo
    }
}
