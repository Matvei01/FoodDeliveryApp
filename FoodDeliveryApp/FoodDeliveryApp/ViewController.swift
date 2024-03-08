//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 08.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -  UI Elements
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight(20))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: -  Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(testLabel)
        setConstraints()
    }
}

// MARK: -  Private Methods
private extension ViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            testLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            testLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}

