//
//  HomeViewController.swift
//  TermProject
//
//  Created by kpugame on 2019. 6. 16..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeViewController:UIViewController {
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let sideMenuViewController = storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as? SideMenuViewController else {return}
        sideMenuViewController.didTapMenuType = { MenuType in
            self.transitionToNew(MenuType)
        }
        sideMenuViewController.modalPresentationStyle = .overCurrentContext
        sideMenuViewController.transitioningDelegate = self
        present(sideMenuViewController, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType){
        let title = String(describing: menuType).capitalized
        self.title = title
        
        topView?.removeFromSuperview()
        switch menuType {
        case .profile:
            let view = UIView()
            view.backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
            break
        case .search:
            let profileview = ViewController()
            profileview.dropDown1 = DropDown()
            profileview.dropDown2 = DropDown()
            profileview.dropDown1?.anchorView = profileview.sidoCd // UIView or UIBarButtonItem
            profileview.dropDown2?.anchorView = profileview.gunguCd // UIView or UIBarButtonItem
            profileview.dropDown1?.bottomOffset = CGPoint(x: 0, y: (profileview.dropDown1?.anchorView?.plainView.bounds.height)!)
            profileview.dropDown2?.bottomOffset = CGPoint(x: 0, y: (profileview.dropDown2?.anchorView?.plainView.bounds.height)!)
            profileview.dropDown1?.dataSource = profileview.si
            self.view.addSubview(profileview.view)
            self.topView = profileview.view
            addChild(profileview)
            break
        case .home:
            let view = UIView()
            view.backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
            break
        default:
            break
        }
    }
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
