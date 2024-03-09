//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 09.03.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        showMainFlow()
        //showOnboardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(
            type: .onboarding,
            navigationController: navigationController,
            finishDelegate: self
        )
        
        addChildCoordinator(onboardingCoordinator)
        
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        let homeCoordinator = HomeCoordinator(
            type: .home,
            navigationController: homeNavigationController
        )
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        orderNavigationController.tabBarItem = UITabBarItem(
            title: "Order",
            image: UIImage(systemName: "list.bullet.clipboard.fill"),
            tag: 1
        )
        let orderCoordinator = OrderCoordinator(
            type: .order,
            navigationController: orderNavigationController
        )
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        listNavigationController.tabBarItem = UITabBarItem(
            title: "List",
            image: UIImage(systemName: "bookmark.fill"),
            tag: 2
        )
        let listCoordinator = ListCoordinator(
            type: .list,
            navigationController: listNavigationController
        )
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.fill"),
            tag: 3
        )
        let profileCoordinator = ProfileCoordinator(
            type: .profile,
            navigationController: profileNavigationController
        )
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController
        ]
        
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
