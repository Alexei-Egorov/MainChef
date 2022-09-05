import UIKit

final class MainNavigationViewController: AppNavigationViewController {
    
    private enum ViewType: Int, CaseIterable {
        case spinner
        case search
        case cookbook
        case grocery
    }
    
    let spinnerVC = UIStoryboard(name: "Spinner", bundle: nil).instantiateViewController(identifier: "Spinner") as! SpinnerViewController
    let searchVC = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(identifier: "Search") as! SearchViewController
    let cookbookVC = UIStoryboard(name: "Cookbook", bundle: nil).instantiateViewController(identifier: "Cookbook") as! CookbookViewController
    let groceryVC = UIStoryboard(name: "Grocery", bundle: nil).instantiateViewController(identifier: "Grocery") as! GroceryViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBottomTabBar() {
        super.setupBottomTabBar()
        
        ViewType.allCases.forEach { type in
            setupTabBarItem(of: type)
        }
        setViewControllers([spinnerVC, searchVC, cookbookVC, groceryVC], animated: true)
    }
    
    private func setupTabBarItem(of type: ViewType) {
        switch type {
        case .spinner:
            spinnerVC.tabBarItem = createTabBar(image: UIImage(named: "spinner"), selectedImage: UIImage(named: "spinner selected"))
        case .search:
            searchVC.tabBarItem = createTabBar(image: UIImage(named: "search"), selectedImage: UIImage(named: "search selected"))
        case .cookbook:
            cookbookVC.tabBarItem = createTabBar(image: UIImage(named: "book"), selectedImage: UIImage(named: "book selected"))
        case .grocery:
            groceryVC.tabBarItem = createTabBar(image: UIImage(named: "grocery"), selectedImage: UIImage(named: "grocery selected"))
        }
    }
}
