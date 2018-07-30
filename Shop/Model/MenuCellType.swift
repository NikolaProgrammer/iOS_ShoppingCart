//
//  MenuCells.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

enum MenuCellType: String {
    case main
    case orders
    case purchases
    case settings
    case exit
    
    var name: String {
        var name: String
        
        switch self {
        case .main:
            name = "Главная"
        case .orders:
            name = "Заказы"
        case .purchases:
            name = "Корзина"
        case .settings:
            name = "Настройки"
        case .exit:
            name = "Выход"
        }
        
        return name
    }
    
    static let allValues: [MenuCellType] = [.main, .orders, .purchases, .settings, .exit]
    
}
