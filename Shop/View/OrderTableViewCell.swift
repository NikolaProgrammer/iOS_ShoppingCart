//
//  OrderTableViewCell.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderStatusLabel: UILabel!
    @IBOutlet weak var orderTotalCostLabel: UILabel!
    
    //MARK: Methods
    func configureCell(withOrder order: Order) {
        let price = order.purchases.reduce(0, { (result, purchase) -> Double in
            let price = (purchase.commodity.quantityInStorage <= 0) ? 0 : purchase.commodity.priceWithDiscount * Double(purchase.quantity)
            return result + price
        })
        
        orderIdLabel.text = String(order.id)
        orderDateLabel.text = Date.string(from: order.date)
        orderStatusLabel.text = order.status.rawValue
        orderTotalCostLabel.text = String(price)
    }
    
}
