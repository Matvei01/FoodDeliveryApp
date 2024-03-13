//
//  ListCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 09.03.2024.
//

import UIKit

final class ListCoordinator: Coordinator {
    
    override func start() {
        let viewController = ViewController()
        viewController.view.backgroundColor = .green
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
