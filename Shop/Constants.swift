//
//  Constants.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

struct TableViewCellIndentifiers {
    static let commodityIdentidier = "commodity"
    static let menuIdentidier = "menu"
    static let bucketIdentifier = "purchase"
    static let orderIdentifier = "order"
}

struct StoryboardIndentifiers {
    static let goods = "showGoods"
    static let carts = "showCarts"
    static let orders = "showOrders"
}

struct ServiceQueries {
    static let allGoods = "http://localhost:3000/goods"
    static let orders = "http://localhost:3000/orders"
    static let getUser = "http://localhost:3000/users?name_like=Nikola"
    static let userOrders = "http://localhost:3000/orders?userId=1"
}
