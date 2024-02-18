//
//  MainTabBarController.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 18.02.2024.
//

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .appTint
    
        let dashboardViewController = createDashboardViewController()
        let housesViewController = createHousesViewController()
        
        viewControllers = [
            dashboardViewController,
           housesViewController
        ]
    }
    private func createDashboardViewController() -> UINavigationController {
        let homeViewModel = DashboardViewModel()
        let homeViewController = DashboardViewController(viewModel: homeViewModel)
        let navController = UINavigationController(rootViewController: homeViewController)
        let image = (UIImage(named: "ic_list") ?? .icList).resizeImage(targetSize: .init(width: 40, height: 40))
        navController.tabBarItem.image = image
        navController.tabBarItem.title = "All Characters"
        return navController
    }
    
    private func createHousesViewController() -> UINavigationController {
        let viewModel = HousesViewModel()
        let viewController = HousesViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: viewController)
        let image = (UIImage(named: "ic_hogwarts") ?? .icHogwarts).resizeImage(targetSize: .init(width: 30, height: 30))
        navController.tabBarItem.image = image
        navController.tabBarItem.title = "Houses"
        return navController
    }
}


