//
//  QueryService.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

class QueryGoodsService: QueryService {
    
    //MARK: - Properties
    var goods: [Commodity] = []

    //MARK: - Methods
    func updateGoods(completion: @escaping () -> ()) {
        guard let url = URL(string: ServiceQueries.allGoods) else { return }
        
        updateEntity(from: url) { (goods: [Commodity]) in
            self.goods = goods
            completion()
        }
    }
}
