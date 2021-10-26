import UIKit

class GroceryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var gradientLayer = CAGradientLayer()
    
    let itemsNames: [String] = [
        "Butter",
        "Eggs",
        "Margarine"
    ]
    
    let itemsAmounts: [String] = [
        "3 table spoon",
        "11/12",
        "11/24 cup"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib.init(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTableViewCell")

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
        headerView.bringSubviewToFront(titleLabel)
    }
    
    
    //MARK: - UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell") as! FoodTableViewCell
        
        cell.itemTitle.text = itemsNames[indexPath.row]
        cell.amountLabel.text = itemsAmounts[indexPath.row]
        
        return cell
    }
}
