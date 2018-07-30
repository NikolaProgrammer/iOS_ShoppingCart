//
//  DateExtensoin.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

private let format = "dd.MM.yyyy"

extension Date {
    
    private static func getDateFormatter(pattern: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = pattern
        return formatter
    }
    
    static func date(from string: String, format: String = format) -> Date {
        return Date.getDateFormatter(pattern: format).date(from: string)!
    }
    
    static func string(from date: Date, format: String = format) -> String {
        return Date.getDateFormatter(pattern: format).string(from: date)
    }
    
}

