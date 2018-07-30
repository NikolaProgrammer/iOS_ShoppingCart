//
//  CommodityTableViewCell.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class CommodityTableViewCell: UITableViewCell {

    //MARK: Properties
    var commodity: Commodity!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton! {
        didSet {
            purchaseButton.customiseButton()
        }
    }
    @IBOutlet weak var commodityImageView: UIImageView!
    
    
    //MARK: Methods
    func configureCell(withCommodity commodity: Commodity) {
        self.commodity = commodity
        
        nameLabel.text = commodity.name
        priceLabel.text = "\(commodity.priceWithDiscount) руб."
        obtainCommodityImage(fromUrl: commodity.imageURL)
    }
    
    //MARK: Private Methods
    private func obtainCommodityImage(fromUrl urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        do {
            let imageData = try Data(contentsOf: url)
            commodityImageView.image = UIImage(data: imageData)
        } catch {
            print("cannot obtain image data: \(error)" + "\n" + "\(error.localizedDescription)")
            commodityImageView.image = UIImage()
        }
    }
}
