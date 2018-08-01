//
//  SideMenuViewController.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 26.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    //MARK: Properties
    private var queryUserService = QueryUserService.shared
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.roundCorners()
        }
    }
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queryUserService.queryUser { (user) in
            self.userNameLabel.text = user?.name
        }
    }
}

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuCellType.allValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIndentifiers.menuIdentidier) as! MenuTableViewCell
        
        let type = MenuCellType.allValues[indexPath.row]
        
        cell.configureCell(with: type)
        
        return cell
    }
}

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        (parent as! ContainerViewController).menuType = cell.type!
    }
}
