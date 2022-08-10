import UIKit

class StagesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var publishButton: UIButton!
    
    let numberOfStages = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RecipeStageCell", bundle: nil), forCellReuseIdentifier: "RecipeStageCell")

        setupPublishButton()
    }
    
    func setupPublishButton() {
        publishButton.backgroundColor = UIColor.clear
        publishButton.applyGradient(colors: [UIColor(named: "LeftGradientColor")!, UIColor(named: "RightGradientColor")!], locations: (CGPoint(x: 0.2, y: 0.7), CGPoint(x: 0.7, y: 0.6)), cornerRadius: 11)
    }

}

extension StagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfStages
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeStageCell") as! RecipeStageCell
        cell.stageLabel.text = "Stage \(indexPath.row + 1)"
        return cell
    }
    
    
}
