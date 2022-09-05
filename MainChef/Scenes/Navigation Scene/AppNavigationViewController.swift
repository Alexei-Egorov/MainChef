import UIKit

class AppNavigationViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomTabBar()
        setupNavigationBar()
    }
    
    func setupBottomTabBar() { }
    
    func createTabBar(image: UIImage?, selectedImage: UIImage?) -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = image
        tabBarItem.selectedImage = selectedImage
//        tabBar.tintColor
        return tabBarItem
    }
    
    private func setupNavigationBar() {
        print("jopta setting up navigation bar")
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = .lightGray
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "SFProText-Semibold", size: 20) ?? .systemFont(ofSize: 20)]
        navigationBarAppearance.isTranslucent = false
        navigationBarAppearance.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearance.shadowImage = UIImage()
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        
//        navigationBarAppearance.mo
        
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .gray
            appearance.shadowColor = .clear
            navigationBarAppearance.standardAppearance = appearance
            navigationBarAppearance.scrollEdgeAppearance = appearance
        }
    }
}
