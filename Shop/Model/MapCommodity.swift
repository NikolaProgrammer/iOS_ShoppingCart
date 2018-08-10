//
//  MapCommodity.swift
//  Shop
//
//  Created by Nikolay Sereda on 02.08.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation
import ObjectMapper

struct MapCommodity: Mappable {

    var id: Int!
    var name: String = ""
    var price: Double!
    var discount: Double!
    var quantityInStorage: Int!
    var imageURLStr: String?

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["model"]
        price <- map["price"]
        discount <- map["discount"]
        quantityInStorage <- map["quantity"]
        imageURLStr <- map["image"]
    }

}

extension MapCommodity {
    var priceWithDiscount: Double {
        return (discount <= 0.0) ? price : price * (1 - discount)
    }
}

extension MapCommodity: Equatable {
    static func == (lhs: MapCommodity, rhs: MapCommodity) -> Bool {
        return lhs.id == rhs.id
    }
}
