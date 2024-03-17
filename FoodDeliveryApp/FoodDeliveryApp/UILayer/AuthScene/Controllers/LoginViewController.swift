//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 17.03.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Views
    private lazy var bottomView: BottomView = {
        let view = BottomView()
        view.facebookButtonAction = facebookButtonPressed
        view.googleButtonAction = googleButtonPressed
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
}

// MARK: - Private methods
private extension LoginViewController {
    func setupView() {
        view.backgroundColor  = .white
        view.addSubview(bottomView)
    }
}

// MARK: - Action
private extension LoginViewController {
    func facebookButtonPressed() {
        print("facebook")
    }
    
    func googleButtonPressed() {
        print("google")
    }
}

// MARK: -  Constraints
private extension LoginViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            bottomView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            bottomView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            bottomView.heightAnchor.constraint(
                equalToConstant: 150)
        ])
        
    }
}

