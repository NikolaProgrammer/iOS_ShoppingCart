//
//  CommodityTableViewCell.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class CommodityTableViewCell: UITableViewCell {

    //MARK: - Properties
    var commodity: Commodity!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton! {
        didSet {
            purchaseButton.customiseButton()
        }
    }
    @IBOutlet weak var commodityImageView: UIImageView!
    
    override func prepareForReuse() {
        purchaseButton.removeTarget(nil, action: nil, for: .allEvents)
    }
    

    //MARK: Methods
    func configureCell(with commodity: Commodity) {
        self.commodity = commodity
        
        nameLabel.text = commodity.name
        priceLabel.text = "\(commodity.priceWithDiscount) руб."
        commodityImageView.setImage(from: commodity.imageURLStr)
      
    }

}
