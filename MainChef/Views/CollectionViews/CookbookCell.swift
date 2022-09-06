import UIKit

class CookbookCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var cookbookName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cookbookName.textColor = .white
    }
    
    func setupCell(with model: CookbookModel) {
        cookbookName.text = model.name
    }

}
