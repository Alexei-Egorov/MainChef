import UIKit

class DishCell: UICollectionViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dishImage.layer.cornerRadius = 12
        dishImage.layer.masksToBounds = true
    }

}
