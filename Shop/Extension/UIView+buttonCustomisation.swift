//
//  UIView+buttonCustomisation.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 27.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

extension UIView {
    
    func customiseButton() {
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        
        layer.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: -1, height: 1)
    }
    
}
