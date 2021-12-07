import UIKit

class SpinnerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var selectedDishImageView: UIImageView!
    @IBOutlet weak var ingredientsPickerView: UIPickerView!
    @IBOutlet weak var dishTypePickerView: UIPickerView!
    @IBOutlet weak var chooseButton: UIButton!
    
    lazy var gradientLayer = CAGradientLayer()
    
    var ingredientsImageArray: [UIImage] = [
        UIImage(named: "beacon")!,
        UIImage(named: "cheese")!,
        UIImage(named: "chocolate")!,
        UIImage(named: "potatoes")!,
        UIImage(named: "strawberry")!
    ]
    
    var dishTypeImageArray: [UIImage] = [
        UIImage(named: "bean salad")!,
        UIImage(named: "broccoli salad")!,
        UIImage(named: "dish")!,
        UIImage(named: "pork butt")!,
        UIImage(named: "salad with broccoli")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ingredientsPickerView.delegate = self
        ingredientsPickerView.dataSource = self
        
        dishTypePickerView.delegate = self
        dishTypePickerView.dataSource = self
        
        setupGradientLayer()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = headerView.bounds
    }
    
    func setupGradientLayer() {
        
        gradientLayer.colors = [UIColor(red: 255/255, green: 78/255, blue: 80/255, alpha: 1.0).cgColor, UIColor(red: 249/255, green: 212/255, blue: 35/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)
        
        headerView.layer.addSublayer(gradientLayer)
    }
    
    func setupView() {
        selectedDishImageView.layer.cornerRadius = 13
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        chooseButton.layer.cornerRadius = 18
        
        headerView.bringSubviewToFront(titleLabel)
    }
    
    
    //MARK: - UIPickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1) {
            return ingredientsImageArray.count
        } else {
            return dishTypeImageArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        
        if (pickerView.tag == 1) {
            myImageView.image = ingredientsImageArray[row]
        } else {
            myImageView.image = dishTypeImageArray[row]
        }
        
        return myImageView
    }

}
