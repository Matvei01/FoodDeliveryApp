//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Matvei Khlestov on 12.03.2024.
//

import UIKit

// MARK: - OnboardingViewController
final class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    private var pages = [OnboardingPartViewController]()
    private var currentPageIndex = 0
    var viewOutput: OnboardingViewOutput?
    
    // MARK: - Views
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        if let firstPage = pages.first {
            pageViewController.setViewControllers(
                [firstPage],
                direction: .forward,
                animated: true
            )
        }
        
        addChild(pageViewController)
        
        pageViewController.didMove(toParent: self)
        
        return pageViewController
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        let page = pages[0]
        let title = page.buttonText
        bottomButton.setTitle(title, for: .normal)
        
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColors.grey
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.setTitleColor(AppColors.black, for: .normal)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Initializer
    init(
        pages: [OnboardingPartViewController] = [OnboardingPartViewController](),
        viewOutput: OnboardingViewOutput
    ) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
}

// MARK: - Private methods
private extension OnboardingViewController {
    func setupView() {
        view.backgroundColor = AppColors.accentOrange
        setupSubviews(
            pageViewController.view,
            pageControl,
            bottomButton
        )
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
}

// MARK: - Actions
private extension OnboardingViewController {
    @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers(
                [pages[1]],
                direction: .forward,
                animated: true,
                completion: nil
            )
            bottomButton.setTitle(pages[1].buttonText, for: .normal)
            
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers(
                [pages[2]],
                direction: .forward,
                animated: true,
                completion: nil
            )
            bottomButton.setTitle(pages[2].buttonText, for: .normal)
            
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers(
                [pages[3]],
                direction: .forward,
                animated: true,
                completion: nil
            )
            bottomButton.setTitle(pages[3].buttonText, for: .normal)
        default:
            print("Exit")
            viewOutput?.onboardingFinish()
        }
    }
}

// MARK: - Constraints
private extension OnboardingViewController {
    func setConstraints() {
        setConstraintsForePageControl()
        setConstraintsForeBottomButton()
    }
    
    func setConstraintsForePageControl() {
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            pageControl.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -45
            )
        ])
    }
    
    func setConstraintsForeBottomButton() {
        NSLayoutConstraint.activate([
            bottomButton.bottomAnchor.constraint(
                equalTo: pageControl.topAnchor,
                constant: -44
            ),
            bottomButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 30
            ),
            bottomButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -30
            ),
            bottomButton.heightAnchor.constraint(
                equalToConstant: 50
            )
        ])
    }
}

// MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController),
              currentIndex > 0 else { return nil }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController),
              currentIndex < pages.count - 1 else { return nil }
        
        return pages[currentIndex + 1]
    }
}

// MARK: - UIPageViewControllerDelegate delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            willTransitionTo pendingViewControllers: [UIViewController]) {
        
        if let pendingVC = pendingViewControllers.first,
           let index = pages.firstIndex(of: pendingVC as! OnboardingPartViewController) {
            currentPageIndex = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = currentPageIndex
            let page = pages[currentPageIndex]
            let title = page.buttonText
            bottomButton.setTitle(title, for: .normal)
        }
    }
}
