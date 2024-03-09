//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 09.03.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
        let viewController = ViewController()
        viewController.view.backgroundColor = .blue
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
