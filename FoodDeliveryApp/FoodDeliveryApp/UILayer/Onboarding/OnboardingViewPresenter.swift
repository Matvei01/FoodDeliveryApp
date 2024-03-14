//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 12.03.2024.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

final class OnboardingViewPresenter: OnboardingViewOutput {
    
    private let userStorage = UserStorage.shared
    
    // MARK: - Properties
    weak var coordinator: OnboardingCoordinator?
    
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        userStorage.passedOnboarding = true
        coordinator?.finish()
    }
}
