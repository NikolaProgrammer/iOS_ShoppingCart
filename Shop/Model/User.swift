//
//  User.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 26.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var purchases: [Purchase]
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case purchases = "bucket"
    }
}
