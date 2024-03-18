//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 15.03.2024.
//

import UIKit

struct SceneFactory {
    
    // MARK: - Onboarding flow
    static func makeOnboardingFlow(coordinator: AppCoordinator,
                                   finishDelegate: CoordinatorFinishDelegate,
                                   navigationController: UINavigationController) {
        let onboardingCoordinator = OnboardingCoordinator(
            type: .onboarding,
            navigationController: navigationController,
            finishDelegate: finishDelegate
        )
        
        coordinator.addChildCoordinator(onboardingCoordinator)
        
        onboardingCoordinator.start()
    }
    
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = .chickenLeg
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = .shipped
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = .medal
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.buttonText = "Next"
        
        let forthVC = OnboardingPartViewController()
        forthVC.imageToShow = .creditCard
        forthVC.titleText = "Payment Online"
        forthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        forthVC.buttonText = "Cool!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(forthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    // MARK: - Onboarding flow
    static func makeMainFlow(coordinator: AppCoordinator,
                             finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
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
        homeCoordinator.finishDelegate = finishDelegate
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
        orderCoordinator.finishDelegate = finishDelegate
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
        listCoordinator.finishDelegate = finishDelegate
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
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController
        ]
        
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        return tabBarController
    }
}
