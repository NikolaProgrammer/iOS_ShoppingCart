//
//  buckerTableViewCell.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 26.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class PurchaseTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var commodityImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceWithDiscountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    
    //MARK: Methods
    func configureCell(withPurchase purchase: Purchase) {
        
        titleLabel.text = purchase.commodity.name
        obtainCommodityImage(fromUrl: purchase.commodity.imageURL)
        
        if purchase.commodity.quantityInStorage <= 0 {
            backgroundImageView.image = UIImage(named: "cell_background_removed")
            let transform = CGAffineTransform(rotationAngle: CGFloat.pi / 90)
            priceLabel.isHidden = true
            quantityLabel.isHidden = true
            arrowImageView.isHidden = true
            
            titleLabel.transform = transform
            priceWithDiscountLabel.transform = transform
            priceWithDiscountLabel.text = "Отсутствует на складе"
            
        } else {
            priceWithDiscountLabel.text = "\(purchase.commodity.priceWithDiscount) руб."
            quantityLabel.text = "кол: \(purchase.quantity)"
       
            if purchase.commodity.discount <= 0.0 {
                priceWithDiscountLabel.isHidden = true
                priceLabel.text = priceWithDiscountLabel.text
            } else {
                let price = NSMutableAttributedString(string: "\(purchase.commodity.price) руб.")
                price.addAttribute(.strikethroughStyle, value: 2, range: NSRange(location: 0, length: price.length))
                priceLabel.attributedText = price
            }
        }

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
