//
//  UIImageView+Customization.swift
//  Shop
//
//  Created by Nikolay Sereda on 01.08.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func roundCorners() {
        layer.cornerRadius = bounds.width / 2
        layer.borderWidth = 10
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
}
