import UIKit
import RxSwift
import RxCocoa

class CreateRecipeViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var chooseImageLabel: UILabel!
    @IBOutlet weak var chooseImageButton: UIButton!
    @IBOutlet weak var giveItANameLabel: UILabel!
    @IBOutlet weak var recipeTitleTextField: UITextField!
    @IBOutlet weak var dishTypeTextField: UITextField!
    @IBOutlet weak var dishTypePicker: UIPickerView!
    @IBOutlet weak var recipeDescriptionTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var ingredientsPicker: UIPickerView!
    @IBOutlet weak var ingredientQuantityTextField: UITextField!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var numberOfStagesPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelToChooseImageButtonConstraint: NSLayoutConstraint!
    
    var imagePicker = UIImagePickerController()
    let imageView = UIImageView()
    let window = UIApplication.shared.windows.first
    
    let pickerStages = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let allIngredients = IngredientType.allCases
    let dishTypes = CommonResources.shared.dishTypes
    var selectedIngredients = [IngredientModel]()
    var selectedItem = ""
    
    var recipe: RecipeModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberOfStagesPicker.delegate = self
        numberOfStagesPicker.dataSource = self
        ingredientsPicker.delegate = self
        ingredientsPicker.dataSource = self
        dishTypePicker.delegate = self
        dishTypePicker.dataSource = self
        recipeTitleTextField.delegate = self
        recipeDescriptionTextField.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SelectedIngredentCell", bundle: .main), forCellWithReuseIdentifier: "SelectedIngredentCell")
        
        addKeyboardHideActionOnTap()
        setupView()
    }
    
    func setupView() {
        setupChooseImageButton()
        setupNextButton()
        recipeTitleTextField.setupAsCustomTextField()
        recipeDescriptionTextField.setupAsCustomTextField()
        setupImageView()
        setupCollectionView()
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
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.layer.borderWidth = 2
        collectionView.layer.borderColor = UIColor(named: "PrimeOrange")?.cgColor
    }
    
    private func validate() -> Bool {
        var ans: Bool = true
        if recipeTitleTextField.text!.isEmpty || dishTypeTextField.text!.isEmpty || recipeDescriptionTextField.text!.isEmpty || selectedIngredients.isEmpty || imageView.image == nil {
            ans = false
            recipeTitleTextField.layer.borderColor = recipeTitleTextField.text!.isEmpty ? UIColor.red.cgColor : nil
            dishTypeTextField.layer.borderColor = dishTypeTextField.text!.isEmpty ? UIColor.red.cgColor : nil
            recipeDescriptionTextField.layer.borderColor = recipeDescriptionTextField.text!.isEmpty ? UIColor.red.cgColor : nil
            collectionView.layer.borderColor = selectedIngredients.isEmpty ? UIColor.red.cgColor : nil
        }
        print("jopta returning validate value: \(ans)")
        return ans
    }
    
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        if ingredientQuantityTextField.text!.isEmpty { return }
        let selectedIngredientType = allIngredients[ingredientsPicker.selectedRow(inComponent: 0)]
        guard let quantity = ingredientQuantityTextField.text?.floatValue else { return }
        selectedIngredients.append(IngredientModel(ingredient: selectedIngredientType, quantity: quantity))
        collectionView.reloadData()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard validate() else { return }
        print("jopta action after validate")
        guard let recipeTitle = recipeTitleTextField.text, let dishType = dishTypeTextField.text, let description = recipeDescriptionTextField.text else { return }
        let recipe = RecipeModel(id: UUID(), name: recipeTitle, photo: imageView.image, dishType: dishType, description: description, ingredients: selectedIngredients, stages: [])
        self.recipe = recipe
        performSegue(withIdentifier: "goToStages", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! StagesViewController
        destinationVC.recipe = recipe
        destinationVC.numberOfStages = numberOfStagesPicker.selectedRow(inComponent: 0) + 1
    }
    
}

//MARK: - UICollectionView
extension CreateRecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedIngredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedIngredentCell", for: indexPath) as! SelectedIngredentCell
        cell.containerView.backgroundColor = UIColor(named: "LeftGradientColor")
        cell.setupCell(ingredient: selectedIngredients[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectedIngredentCell
        let cellText = cell.ingredientLabel.text
        selectedIngredients = selectedIngredients.filter { $0.ingredientType.rawValue != cellText }
        collectionView.reloadData()
    }
}

//MARK: - UICollectionView Flow Layout
extension CreateRecipeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        let ingredient = selectedIngredients[indexPath.row]
        label.font = UIFont(name: "SFProText-Semibold", size: 15)
        label.text = ingredient.ingredientType.rawValue + " \(ingredient.quantity)\(ingredient.ingredientType.quantityType)"
        let labelWidth = label.intrinsicContentSize.width
        return CGSize(width: labelWidth + 12, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

//MARK: - UIPickerView
extension CreateRecipeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return pickerStages.count
        } else if pickerView.tag == 2 {
            return allIngredients.count
        } else {
            return dishTypes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return pickerStages[row]
        } else if pickerView.tag == 2 {
            return allIngredients[row].rawValue
        } else {
            return dishTypes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 3 {
            dishTypeTextField.text = dishTypes[row]
        }
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
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        dismiss(animated: true)
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
