//
//  SideMenuViewController.swift
//  TermProject
//
//  Created by kpugame on 2019. 6. 16..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

enum MenuType: Int{
    case home
    case search
    case profile
}

class SideMenuViewController: UITableViewController {

    var didTapMenuType : ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true){[weak self] in
            self?.didTapMenuType?(menuType)
        }
    }

}
