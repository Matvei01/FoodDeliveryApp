//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 09.03.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
//        userStorage.passedOnboarding = false
//        if userStorage.passedOnboarding {
//            showMainFlow()
//        } else {
//            showOnboardingFlow()
//        }
        
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
