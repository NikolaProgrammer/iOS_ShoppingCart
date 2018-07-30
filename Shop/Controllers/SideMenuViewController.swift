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
    private var queryService = QueryService.shared
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
            avatarImageView.layer.borderWidth = 10
            avatarImageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            avatarImageView.layer.masksToBounds = false
            avatarImageView.clipsToBounds = true
        }
    }
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queryService.queryUser { (user) in
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
        
        cell.configureCell(withType: type)
        
        return cell
    }
}

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        (parent as! ContainerViewController).menuType = cell.type!
    }
}
