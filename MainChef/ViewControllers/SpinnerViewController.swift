import UIKit

class SpinnerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ingredientsPickerView: UIPickerView!
    
    var imageArray: [UIImage] = [
        UIImage(named: "beacon")!,
        UIImage(named: "cheese")!,
        UIImage(named: "chocolate")!,
        UIImage(named: "potatoes")!,
        UIImage(named: "strawberry")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ingredientsPickerView.delegate = self
        ingredientsPickerView.dataSource = self
        imageView.image = UIImage(named: "chocolate")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
//        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        var myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
//        switch row {
//        case 0:
//            myImageView = UIImageView(image: UIImage(named: "beacon"))
//        case 1:
//            myImageView = UIImageView(image: UIImage(named: "cheese"))
//        case 2:
//            myImageView = UIImageView(image: UIImage(named: "chocolate"))
//        default:
//            myImageView = UIImageView(image: UIImage(named: "chocolate"))
//        }
        
        myImageView.image = imageArray[row]
        
//        myView.addSubview(myImageView)
        
        return myImageView
    }

}
