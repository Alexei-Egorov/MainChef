import UIKit

final class MainNavigationViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomTabBar()
    }
    
    private func setupBottomTabBar() {
        var window: UIWindow?
        let tabController = UITabBarController()
        
        let spinnerVC = UIStoryboard(name: "Spinner", bundle: nil).instantiateViewController(identifier: "Spinner") as! SpinnerViewController
        let searchVC = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(identifier: "Search") as! SearchViewController
        let cookbookVC = UIStoryboard(name: "Cookbook", bundle: nil).instantiateViewController(identifier: "Cookbook") as! CookbookViewController
        let groceryVC = UIStoryboard(name: "Grocery", bundle: nil).instantiateViewController(identifier: "Grocery") as! GroceryViewController
        
        let vcData: [(UIViewController, UIImage, UIImage)] = [
            (spinnerVC, UIImage(named: "spinner")!, UIImage(named: "spinner selected")!),
            (searchVC, UIImage(named: "search")!, UIImage(named: "search selected")!),
            (cookbookVC, UIImage(named: "book")!, UIImage(named: "book selected")!),
            (groceryVC, UIImage(named: "grocery")!, UIImage(named: "grocery selected")!)
        ]
        
        let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UINavigationController in
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = defaultImage
            nav.tabBarItem.selectedImage = selectedImage
            return nav
        }
        
        tabController.viewControllers = vcs
        tabController.tabBar.isTranslucent = false
        tabController.tabBar.backgroundColor = .white
        
        if let items = tabController.tabBar.items {
            for item in items {
                if let image = item.image {
                    item.image = image.withRenderingMode(.alwaysOriginal)
                }
                if let selectedImage = item.selectedImage {
                    item.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
                }
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
        
        UINavigationBar.appearance().isHidden = false
        
        window?.rootViewController = tabController
    }
    
    
}



//let spinnerStoryboard = UIStoryboard(name: "Spinner", bundle: nil)
//let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
//let cookbookStoryboard = UIStoryboard(name: "Cookbook", bundle: nil)
//let groceryStoryboard = UIStoryboard(name: "Grocery", bundle: nil)
//
//let spinnerVC = spinnerStoryboard.instantiateViewController(identifier: "Spinner") as! SpinnerViewController
//let searchVC = searchStoryboard.instantiateViewController(identifier: "Search") as! SearchViewController
//let cookbookVC = cookbookStoryboard.instantiateViewController(identifier: "Cookbook") as! CookbookViewController
//let groceryVC = groceryStoryboard.instantiateViewController(identifier: "Grocery") as! GroceryViewController
//
//let vcData: [(UIViewController, UIImage, UIImage)] = [
//    (spinnerVC, UIImage(named: "spinner")!, UIImage(named: "spinner selected")!),
//    (searchVC, UIImage(named: "search")!, UIImage(named: "search selected")!),
//    (cookbookVC, UIImage(named: "book")!, UIImage(named: "book selected")!),
//    (groceryVC, UIImage(named: "grocery")!, UIImage(named: "grocery selected")!)
//]
//
//let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UINavigationController in
//    let nav = UINavigationController(rootViewController: vc)
//    nav.tabBarItem.image = defaultImage
//    nav.tabBarItem.selectedImage = selectedImage
//    return nav
//}
//
//tabController.viewControllers = vcs
//tabController.tabBar.isTranslucent = false
////        tabController.delegate = tabBarDelegate
//tabController.tabBar.backgroundColor = UIColor.white
//
//if let items = tabController.tabBar.items {
//    for item in items {
//        if let image = item.image {
//            item.image = image.withRenderingMode(.alwaysOriginal)
//        }
//        if let selectedImage = item.selectedImage {
//            item.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
//        }
//        item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//    }
//}
//
////        UINavigationBar.appearance().backgroundColor = UIColor.clear
//UINavigationBar.appearance().isHidden = false
//
//window?.rootViewController = tabController
