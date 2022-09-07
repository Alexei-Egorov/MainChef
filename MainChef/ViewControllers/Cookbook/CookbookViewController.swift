import UIKit

class CookbookViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet var cookbooksCollectionView: UICollectionView!
    @IBOutlet weak var dishesCollectionView: UICollectionView!
    
    lazy var gradientLayer = CAGradientLayer()
    
    let viewModel = CookbookViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cookbooksCollectionView.delegate = self
        cookbooksCollectionView.dataSource = self
        dishesCollectionView.delegate = self
        dishesCollectionView.dataSource = self
        
        cookbooksCollectionView.register(UINib(nibName: "CookbookCell", bundle: nil), forCellWithReuseIdentifier: "CookbookCell")
        dishesCollectionView.register(UINib.init(nibName: "DishCell", bundle: nil), forCellWithReuseIdentifier: "DishCell")

        setupGradientLayer()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = headerView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cookbooksCollectionView.reloadData()
        dishesCollectionView.reloadData()
    }
    
    func setupGradientLayer() {
        
        gradientLayer.colors = [UIColor(red: 255/255, green: 78/255, blue: 80/255, alpha: 1.0).cgColor, UIColor(red: 249/255, green: 212/255, blue: 35/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)
        
        headerView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupView() {
        cookbooksCollectionView.backgroundColor = .clear
    }
    
    //MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return viewModel.usersCookbooks.count + 1
        } else {
            return viewModel.selectedCookBook?.recipesIds.count ?? 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CookbookCell", for: indexPath) as! CookbookCell
            if indexPath.row == viewModel.usersCookbooks.count {
                cell.imageView.image = UIImage(named: "addButtonIcon")
                cell.cookbookName.text = "New Cookbook"
            } else {
                cell.setupCell(with: viewModel.usersCookbooks[indexPath.row])
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishCell", for: indexPath) as! DishCell
            cell.setupCell(with: viewModel.recipesToShow[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            if indexPath.row == viewModel.usersCookbooks.count {
                let popupController = UIAlertController(title: "New cookbook", message: "Provide the name of the new cookbook", preferredStyle: .alert)
                popupController.addTextField()
                popupController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                popupController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
                    let providedName = popupController.textFields![0].text!
                    guard !providedName.isEmpty else { return }
                    self?.viewModel.createCookbook(name: providedName)
                    self?.cookbooksCollectionView.reloadData()
                }))
                self.present(popupController, animated: true, completion: nil)
            } else {
                viewModel.selectedCookBook = viewModel.usersCookbooks[indexPath.row]
                viewModel.loadCookbookRecipes()
                dishesCollectionView.reloadData()
            }
        } else {
            let detailsVC = RecipeDetailsViewController(viewModel: RecipeDetailsViewModel(recipe: viewModel.recipesToShow[indexPath.row]))
            show(detailsVC, sender: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 70, height: 70)
        } else {
            let itemsPerRow: CGFloat = 2
            let padding: CGFloat = 6
            let edgeInset: CGFloat = 8
            
            let collectionViewWidth = collectionView.frame.width - (padding * (itemsPerRow - 1) + (edgeInset * 2))
            let widthPerItem = collectionViewWidth / itemsPerRow
            
            return CGSize(width: widthPerItem, height: widthPerItem)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
    
}
