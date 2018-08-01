//
//  UIImageView+Downloading.swift
//  Shop
//
//  Created by Nikolay Sereda on 01.08.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImage(from urlStr: String, completion: @escaping (UIImageView) -> () ) {
        guard let url = URL(string: urlStr) else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let imageData = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)!
                }
            } catch {
                print("cannot obtain image data: \(error)" + "\n" + "\(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                completion(self)
            }
        }
        
    }
}
