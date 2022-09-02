import UIKit

protocol RootNavigationInterface {
    func setCurrentViewController(_ viewController: UIViewController)
}

extension RootNavigationInterface {
    func setCurrentViewController(_ viewController: UIViewController) {
        AppDelegate.shared.rootViewController?.setCurrentViewController(to: viewController)
    }
}

class RootViewController: UIViewController {
    
    var currentViewController: UIViewController!
    
    convenience init(currentView: UIViewController) {
        self.init()
        self.currentViewController = currentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        addChild(currentViewController)
        currentViewController.view.frame = view.bounds
        view.addSubview(currentViewController.view)
        currentViewController.didMove(toParent: self)
    }
    
    func setCurrentViewController(to viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = view.frame
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)

        currentViewController.willMove(toParent: nil)
        currentViewController.removeFromParent()
        currentViewController.view.removeFromSuperview()
        currentViewController = viewController
    }
}
