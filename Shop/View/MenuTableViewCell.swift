//
//  MenuTableViewCell.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    //MAR: Properties
    var type: MenuCellType?
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: Methods
    func configureCell(with type: MenuCellType) {
        self.type = type
        nameLabel.text = type.name
        iconImageView.image = UIImage(named: type.rawValue)
    }
}
