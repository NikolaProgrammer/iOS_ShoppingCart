//
//  ShowCartsViewController.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class ShowPurchasesViewController: BaseViewController {
    
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chekoutButton: UIButton! {
        didSet {
            chekoutButton.customise()
        }
    }
    
    var purchases: [Purchase] = []
    
    @IBAction func checkoutButtonTapped(_ sender: UIButton) {
     
    }
    
}

// MARK: - UITableViewDataSource
extension ShowPurchasesViewController: UITableViewDataSource, UITableViewDelegate {

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

