//
//  FoodDeliveryButton.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 18.03.2024.
//

import UIKit

enum FDButtonColorSchemes {
    case white
    case orange
    case grey
}

final class FoodDeliveryButton: UIView {
    
    // MARK: - Properties
    var scheme: FDButtonColorSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    
    var action: (() -> Void)?
    
    // MARK: -  Views
    private lazy var reusableButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(reusableButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Initializer
    init(scheme: FDButtonColorSchemes = .white) {
        super.init(frame: .zero)
        self.scheme = scheme
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set title
extension FoodDeliveryButton {
    func setTitle(_ title: String?) {
        reusableButton.setTitle(title, for: .normal)
    }
}

// MARK: - Private methods
private extension FoodDeliveryButton {
    func setupView() {
        self.backgroundColor = .clear
        self.addSubview(reusableButton)
    }
}

// MARK: - Action
private extension FoodDeliveryButton {
    @objc func reusableButtonPressed() {
        guard let action = self.action else { return }
        action()
    }
}

// MARK: - Color schemes
private extension FoodDeliveryButton {
    func setColorScheme(scheme: FDButtonColorSchemes) {
        switch scheme {
        case .white:
            reusableButton.backgroundColor = AppColors.white
            reusableButton.setTitleColor(AppColors.accentOrange, for: .normal)
        case .orange:
            reusableButton.backgroundColor = AppColors.accentOrange
            reusableButton.setTitleColor(AppColors.white, for: .normal)
        case .grey:
            reusableButton.backgroundColor = AppColors.grey
            reusableButton.setTitleColor(AppColors.black, for: .normal)
        }
    }
}

// MARK: -  Constraints
private extension FoodDeliveryButton {
    func setConstraints() {
        NSLayoutConstraint.activate([
            reusableButton.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            ),
            reusableButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor
            ),
            reusableButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor
            ),
            reusableButton.topAnchor.constraint(
                equalTo: self.topAnchor
            )
        ])
    }
}



