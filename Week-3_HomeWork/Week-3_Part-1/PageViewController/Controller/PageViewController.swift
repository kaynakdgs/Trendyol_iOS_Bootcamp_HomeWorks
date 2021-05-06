//
//  PageViewController.swift
//  Week-3_Part-1
//
//  Created by Kerim Caglar on 1.05.2021.
//

import UIKit

class PageViewController: UIViewController {

    var controllers = [UIViewController]()
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        controllers.append(vc1)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        controllers.append(vc2)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green
        controllers.append(vc3)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.pageVC()
    }

    func pageVC() {
        guard let first = controllers.first else { return }
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        vc.view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: vc.view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20.0),
            pageControl.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor, constant: -16.0)
        ])
        pageControlStyle()
        present(vc, animated: true)
    }
    
    func pageControlStyle() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .white
        pageControl.numberOfPages = controllers.count
        pageControl.currentPage = 0
    }
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index > 0 else { return nil}
        
        let prev = index - 1
        return controllers[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index < (controllers.count - 1) else { return nil}
        
        let next = index + 1
        return controllers[next]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        pageControl.currentPage = controllers.firstIndex(of: pageContentViewController)!
    }
    
}

//MARK: PageControll kullanarak active sayfayı belirleyiniz(DONE)
