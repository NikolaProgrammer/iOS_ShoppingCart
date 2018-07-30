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

