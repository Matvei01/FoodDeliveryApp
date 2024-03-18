//
//  BottomView.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 17.03.2024.
//

import UIKit

final class BottomView: UIView {
    
    // MARK: - Properties
    var facebookButtonAction: (() ->Void)?
    var googleButtonAction: (() ->Void)?
    
    // MARK: -  Views
    private lazy var burgerLabel: UILabel = {
        let label = UILabel()
        label.text = "Or connect with"
        label.textColor = AppColors.bottomViewGrey
        label.font = .Roboto.regular.size(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.bottomViewGrey.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var burgerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "BottomViewImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(facebookButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "google"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
private extension BottomView {
    func setupView() {
        self.backgroundColor = .clear
        setupSubviews(
            lineView,
            burgerLabel,
            burgerImage,
            facebookButton,
            googleButton
        )
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}

// MARK: - Action
private extension BottomView {
    @objc func facebookButtonTapped() {
        facebookButtonAction?()
    }
    
    @objc func googleButtonTapped() {
        googleButtonAction?()
    }
}

// MARK: -  Constraints
private extension BottomView {
    func setConstraints() {
        setConstraintsForBorderView()
        setConstraintsForLabel()
        setConstraintsForBurgerImage()
        setConstraintsForFacebookButton()
        setConstraintsForGoogleButton()
    }
    
    func setConstraintsForBorderView() {
        NSLayoutConstraint.activate([
            lineView.centerYAnchor.constraint(
                equalTo: burgerLabel.centerYAnchor,
                constant: 0
            ),
            lineView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor
            ),
            lineView.trailingAnchor.constraint(
                equalTo: burgerLabel.leadingAnchor,
                constant: -12
            ),
            lineView.heightAnchor.constraint(
                equalToConstant: 2
            )
        ])
    }
    
    func setConstraintsForLabel() {
        NSLayoutConstraint.activate([
            burgerLabel.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 0
            ),
            burgerLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -30
            )
        ])
    }
    
    func setConstraintsForBurgerImage() {
        NSLayoutConstraint.activate([
            burgerImage.topAnchor.constraint(
                equalTo: lineView.bottomAnchor,
                constant: 12
            ),
            burgerImage.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: -60
            ),
            burgerImage.heightAnchor.constraint(
                equalToConstant: 150
            ),
            burgerImage.widthAnchor.constraint(
                equalToConstant: 282
            )
        ])
    }
    
    func setConstraintsForFacebookButton() {
        NSLayoutConstraint.activate([
            facebookButton.trailingAnchor.constraint(
                equalTo: googleButton.leadingAnchor,
                constant: -20
            ),
            facebookButton.centerYAnchor.constraint(
                equalTo: googleButton.centerYAnchor,
                constant: 0
            )
        ])
    }
    
    func setConstraintsForGoogleButton() {
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(
                equalTo: burgerLabel.bottomAnchor,
                constant: 20
            ),
            googleButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -30
            )
        ])
    }
}
