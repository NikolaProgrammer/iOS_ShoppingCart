//
//  ViewController.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class ShowGoodsViewController: UIViewController {
    
    //MARK: Properties
    let queryService = QueryService.shared
    var goods: [Commodity] = []
    
    @IBOutlet weak var goodsTableView: UITableView!
   
    //MARK: View lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queryService.queryGoods() { (goods) in
            if let goods = goods {
                self.goods = goods
                self.goodsTableView.reloadData()
            }
        }
        
    }
    
    @objc func addToCardButtonTapped(_ button: UIButton) {

    }
}

extension ShowGoodsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let commodity = goods[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIndentifiers.commodityIdentidier) as! CommodityTableViewCell
        cell.configureCell(with: commodity)
        cell.purchaseButton.addTarget(self, action: #selector(addToCardButtonTapped(_:)), for: .touchUpInside)
        return cell

    }
}
