//
//  ShowCartsViewController.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class ShowPurchasesViewController: BaseViewController {
    
    //MARK: Properties
    let queryService = QueryService.shared
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chekoutView: UIButton! {
        didSet {
            chekoutView.customiseButton()
        }
    }
    
    var purchases: [Purchase] = []
    
    @IBAction func checkoutButtonTapped(_ sender: UIButton) {
        var id = 0
        queryService.queryOrders { (orders) in
            id = orders!.count + 1
        }
        
        let order = Order(id: id, userId: queryService.user.id, purchases: purchases, date: Date(), status: Order.OrderStatus.open)
        queryService.addOrder(order: order)
    }
    
}

extension ShowPurchasesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIndentifiers.bucketIdentifier) as! PurchaseTableViewCell
        let purchase = purchases[indexPath.row]
        
        cell.configureCell(withPurchase: purchase)
        return cell
    }
}

