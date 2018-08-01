//
//  Commodity.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

struct Commodity: Codable, Equatable {
    var id: Int
    var name: String
    var price: Double
    var discount: Double
    var quantityInStorage: Int
    var imageURLStr: String

    private enum CodingKeys : String, CodingKey {
        case id
        case name = "model"
        case price
        case discount
        case quantityInStorage = "quantity"
        case imageURLStr = "image"
    }

}

extension Commodity {
    var priceWithDiscount: Double {
        return (discount <= 0.0) ? price : price * (1 - discount)
    }
}
