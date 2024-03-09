//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 09.03.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

