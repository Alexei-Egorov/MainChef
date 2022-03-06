import UIKit

class RecipeCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        descriptionTextField.setupAsCustomTextField()
        descriptionTextField.delegate = self
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        descriptionTextField.resignFirstResponder()
        
        return true
    }
}


