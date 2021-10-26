import UIKit

class SpinnerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var ingredientsPickerView: UIPickerView!
    @IBOutlet weak var dishTypePickerView: UIPickerView!
    
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
    }
    
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
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        if (pickerView.tag == 1) {
            myImageView.image = ingredientsImageArray[row]
        } else {
            myImageView.image = dishTypeImageArray[row]
        }
        
        return myImageView
    }

}
