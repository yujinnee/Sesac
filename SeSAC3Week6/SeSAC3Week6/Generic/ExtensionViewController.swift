//
//  ExtensionViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/24.
//

import UIKit

extension UIViewController {
    enum TransitionStyle {
        case present//네비게이션 없이 present
        case presentNavigation//네비게이션 임베드 된 present
        case presentFullNavigation//네비게이션 임베드 된 fullscreen present
        case push
    }
    
    func transition<T: UIViewController>(viewController: T.Type,storyboard: String,style: TransitionStyle) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else {return}
        switch style{
        case .present:
            present(vc,animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(vc,animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func configureBorder<T: UIView>(view: T){
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        
    }
    
    func sum<T: AdditiveArithmetic>(a :T, b: T) -> T {
        return a + b
    }
    

}
