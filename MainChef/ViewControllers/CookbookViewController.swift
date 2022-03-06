import UIKit

class CookbookViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var favouritesImage: UIImageView!
    @IBOutlet weak var favouritesLabel: UILabel!
    @IBOutlet weak var newCookbookImage: UIView!
    @IBOutlet weak var newCookbookLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var gradientLayer = CAGradientLayer()
    
    let postsDescriptions: [String] = [
        "Pork Butt Roast with Mashroom Gravy",
        "Black Bean Salad"
    ]
    
    let postsImages: [UIImage] = [
        UIImage(named: "dish")!,
        UIImage(named: "salad with broccoli")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "DishCell", bundle: nil), forCellWithReuseIdentifier: "DishCell")

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
    
    //MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postsDescriptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishCell", for: indexPath) as! DishCell
        
        cell.dishImage.image = postsImages[indexPath.row]
        cell.dishNameLabel.text = postsDescriptions[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 2
        let padding: CGFloat = 6
        let edgeInset: CGFloat = 8
        
        let collectionViewWidth = collectionView.frame.width - (padding * (itemsPerRow - 1) + (edgeInset * 2))
        let widthPerItem = collectionViewWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
    
}
