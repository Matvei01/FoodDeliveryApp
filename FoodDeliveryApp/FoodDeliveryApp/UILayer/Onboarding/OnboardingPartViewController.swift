//
//  OnboardingPartViewController.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 14.03.2024.
//

import UIKit

// MARK: - OnboardingPartViewController
final class OnboardingPartViewController: UIViewController {
    
    // MARK: - Properties
    var imageToShow: UIImage? {
        didSet {
            imageView.image = imageToShow
        }
    }
    
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    var buttonText: String?
    
    // MARK: - Views
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        setupLabel(font: .Roboto.bold.size(of: 24))
    }()
    
    private lazy var descriptionLabel: UILabel = {
        setupLabel(font: .Roboto.regular.size(of: 14))
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private methods
private extension OnboardingPartViewController {
    func setupView() {
        view.backgroundColor = AppColors.accentOrange
        setupSubviews(
            imageView,
            titleLabel,
            descriptionLabel
        )
        setConstraints()
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    func setupLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
}

// MARK: - Constraints
private extension OnboardingPartViewController {
    func setConstraints() {
        setConstraintsForeImageView()
        setConstraintsForeTitleLabel()
        setConstraintsForeDescriptionLabel()
    }
    
    func setConstraintsForeImageView() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            imageView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -50
            ),
            imageView.widthAnchor.constraint(
                equalToConstant: 200
            ),
            imageView.heightAnchor.constraint(
                equalToConstant: 200
            )
        ])
    }
    
    func setConstraintsForeTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: 20
            ),
            titleLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            )
        ])
    }
    
    func setConstraintsForeDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 23
            ),
            descriptionLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 70
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -70
            )
        ])
    }
}
