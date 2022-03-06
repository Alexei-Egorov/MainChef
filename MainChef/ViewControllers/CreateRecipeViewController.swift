import UIKit

class CreateRecipeViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var chooseImageLabel: UILabel!
    @IBOutlet weak var chooseImageButton: UIButton!
    @IBOutlet weak var giveItANameLabel: UILabel!
    @IBOutlet weak var recipeTitleTextField: UITextField!
    @IBOutlet weak var recipeDescriptionTextField: UITextField!
    @IBOutlet weak var selectIngredientsView: UIView!
    @IBOutlet weak var numberOfStagesPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelToChooseImageButtonConstraint: NSLayoutConstraint!
    
    var imagePicker = UIImagePickerController()
    let imageView = UIImageView()
    let window = UIApplication.shared.windows.first
    
    let pickerStages = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberOfStagesPicker.delegate = self
        numberOfStagesPicker.dataSource = self
        recipeTitleTextField.delegate = self
        recipeDescriptionTextField.delegate = self
        
        setupView()
    }
    
    func setupView() {
        setupChooseImageButton()
        setupNextButton()
        recipeTitleTextField.setupAsCustomTextField()
        recipeDescriptionTextField.setupAsCustomTextField()
        setupImageView()
    }
    
    func setupChooseImageButton() {
        chooseImageButton.backgroundColor = UIColor.clear
        chooseImageButton.setImage(UIImage(named: "chooseImageIcon"), for: .normal)
    }
    
    func setupNextButton() {
        nextButton.backgroundColor = UIColor.clear
        nextButton.applyGradient(colors: [UIColor(named: "LeftGradientColor")!, UIColor(named: "RightGradientColor")!], locations: (CGPoint(x: 0.2, y: 0.7), CGPoint(x: 0.7, y: 0.6)), cornerRadius: 11)
    }
    
    func setupImageView() {
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        imageView.contentMode = .scaleAspectFit
    }

    // chooseImageButtonTapped situated below
    
}

//MARK: - UIPickerView
extension CreateRecipeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerStages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerStages[row]
    }
}

//MARK: - UIImagePickerController
extension CreateRecipeViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBAction func chooseImageButtonTapped(_ sender: UIButton) {
        labelToChooseImageButtonConstraint.isActive = false
        chooseImageLabel.isHidden = true
        chooseImageButton.isHidden = true
        contentView.addSubview(imageView)
        NSLayoutConstraint(item: giveItANameLabel!, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 25).isActive = true
        contentViewHeightConstraint.constant = 900
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { fatalError("Expected a dictionary containing an image, but was provided the following: \(info)") }
        imageView.image = image
    }
    
}

//MARK: - UITextField
extension CreateRecipeViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        recipeTitleTextField.resignFirstResponder()
        recipeDescriptionTextField.resignFirstResponder()
        
        return true
    }
}
