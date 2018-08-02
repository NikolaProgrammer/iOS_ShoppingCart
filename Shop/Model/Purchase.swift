//
//  Purchase.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

struct Purchase: Codable, Equatable {
    var commodity: Commodity
    var quantity: Int
}
