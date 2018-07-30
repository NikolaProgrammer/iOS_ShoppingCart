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
    case purchases
    case bucket
    case settings
    case exit
    
    var name: String {
        var name: String
        
        switch self {
        case .main:
            name = "Главная"
        case .purchases:
            name = "Заказы"
        case .bucket:
            name = "Корзина"
        case .settings:
            name = "Настройки"
        case .exit:
            name = "Выход"
        }
        
        return name
    }
    
    static let allValues: [MenuCellType] = [.main, .purchases, .bucket, .settings, .exit]
    
}
