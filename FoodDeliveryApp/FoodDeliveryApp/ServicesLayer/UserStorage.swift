//
//  UserStorage.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 14.03.2024.
//

import Foundation

final class UserStorage {
    
    static let shared = UserStorage()
    
    var passedOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: "passedOnboarding") }
        set { UserDefaults.standard.setValue(newValue, forKey: "passedOnboarding") }
    }
    
    private init() {}
}
