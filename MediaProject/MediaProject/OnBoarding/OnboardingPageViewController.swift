//
//  OnboardingPageViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/28.
//

import UIKit


class OnboardingPageViewController: UIPageViewController {
    private var pageList = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        pageList = [FirstPageViewController(),SecondPageViewController(),ThirdPageViewController()]
        
        delegate = self
        dataSource = self
        view.backgroundColor = .systemPink
        
        guard let first = pageList.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
        
    }
    

   

}

extension OnboardingPageViewController: UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageList.firstIndex(of: viewController) else { return nil }
        let previousIndex = currentIndex - 1
        
        return previousIndex < 0 ? nil : pageList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageList.firstIndex(of: viewController) else { return nil }
        let nextIndex = currentIndex + 1
        
        return nextIndex >= pageList.count ? nil : pageList[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = pageList.firstIndex(of: first) else { return 0 }
        return index
    }
    
}
