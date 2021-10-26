import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var favouritesImage: UIImageView!
    @IBOutlet weak var favouritesLabel: UILabel!
    @IBOutlet weak var newCookbookImage: UIView!
    @IBOutlet weak var newCookbookLabel: UILabel!
    
    lazy var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradientLayer()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = headerView.bounds
    }
    
    func setupGradientLayer() {
        
        gradientLayer.colors = [UIColor(red: 255/255, green: 78/255, blue: 80/255, alpha: 1.0).cgColor, UIColor(red: 249/255, green: 212/255, blue: 35/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)
        
        headerView.layer.addSublayer(gradientLayer)
    }
    
    func setupView() {
        favouritesImage.layer.cornerRadius = 17
        newCookbookImage.layer.cornerRadius = 35
        
        headerView.bringSubviewToFront(favouritesImage)
        headerView.bringSubviewToFront(favouritesLabel)
        headerView.bringSubviewToFront(newCookbookImage)
        headerView.bringSubviewToFront(newCookbookLabel)
    }
    

}
