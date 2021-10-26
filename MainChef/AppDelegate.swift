//
//  AppDelegate.swift
//  MainChef
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabController = UITabBarController()
        
        let spinnerStoryboard = UIStoryboard(name: "Spinner", bundle: nil)
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let groceryStoryboard = UIStoryboard(name: "Grocery", bundle: nil)
        
        let spinnerVC = spinnerStoryboard.instantiateViewController(identifier: "Spinner") as! SpinnerViewController
        let searchVC = searchStoryboard.instantiateViewController(identifier: "Search") as! SearchViewController
        let profileVC = profileStoryboard.instantiateViewController(identifier: "Profile") as! ProfileViewController
        let groceryVC = groceryStoryboard.instantiateViewController(identifier: "Grocery") as! GroceryViewController
        
        let vcData: [(UIViewController, UIImage, UIImage)] = [
            (spinnerVC, UIImage(named: "spinner")!, UIImage(named: "spinner selected")!),
            (searchVC, UIImage(named: "search")!, UIImage(named: "search selected")!),
            (profileVC, UIImage(named: "profile")!, UIImage(named: "profile selected")!),
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
//        tabController.delegate = tabBarDelegate
        
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
        
//        UINavigationBar.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().isHidden = true
        
        window?.rootViewController = tabController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

