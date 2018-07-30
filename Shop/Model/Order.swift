//
//  Order.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

struct Order: Codable{
    
    enum OrderStatus: String, Codable {
        case open = "Открыт"
        case received = "Получен"
        case rejected = "Отклонен"
    }
    
    var id: Int
    var userId: Int
    var purchases: [Purchase]
    var date: Date
    var status: OrderStatus
}
