//
//  ShowOrdersViewController.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class ShowOrdersViewController: BaseViewController {

    //MARK: - Properties
    let queryOrderService = QueryOrderService()
    var orders: [Order] = []
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queryOrderService.queryOrders { (orders) in
            self.orders = orders!
            self.tableView.reloadData()
        }
    }  
}

//MARK: - UITableViewDataSource
extension ShowOrdersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIndentifiers.orderIdentifier) as! OrderTableViewCell
        let order = orders[indexPath.section]
        
        cell.configureCell(with: order)
        
        return cell
    }
 
}

//MARK: - UITableViewDelegate
extension ShowOrdersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let order = orders.remove(at: indexPath.section)
            queryOrderService.deleteOrder(order)
            tableView.deleteSections(IndexSet(arrayLiteral: indexPath.section), with: .automatic)
        }
    }
}
