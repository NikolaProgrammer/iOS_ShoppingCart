//
//  ShowOrdersViewController.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class ShowOrdersViewController: BaseViewController {

    //MARK: Properties
    let queryService = QueryService.shared
    var orders: [Order] = []
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: View lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queryService.queryOrders { (orders) in
            self.orders = orders!
            self.tableView.reloadData()
        }
    }  
}

extension ShowOrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIndentifiers.orderIdentifier) as! OrderTableViewCell
        let order = orders[indexPath.row]
        
        cell.configureCell(withOrder: order)
        
        return cell
    }
    
    
}
