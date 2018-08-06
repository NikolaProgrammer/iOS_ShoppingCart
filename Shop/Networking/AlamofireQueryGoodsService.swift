//
//  AlamofireQueryGoodsService.swift
//  Shop
//
//  Created by Nikolay Sereda on 02.08.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class AlamofireQueryGoodsService {
    //MARK: - Properties
    var goods: [MapCommodity] = []
    
    //MARK: - Methods
    func queryGoods(comletion: @escaping ([MapCommodity]) -> ()) {
        Alamofire.request(ServiceQueries.allGoods).responseJSON { (responce) in
            if let error = responce.error {
                print("error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            }
            if let json = responce.result.value as? [[String : Any]] {
                self.goods = Mapper().mapArray(JSONArray: json)
                comletion(self.goods)
            }
        }
    }

}
