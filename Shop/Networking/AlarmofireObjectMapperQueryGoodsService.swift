
//
//  AlarmofireObjectMapperQueryGoodsService.swift
//  Shop
//
//  Created by Nikolay Sereda on 03.08.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class AlarmofireObjectMapperQueryGoodsService {
    //MARK: - Properties
    var goods: [MapCommodity] = []
    
    //MARK: - Methods
    func queryGoods(comletion: @escaping ([MapCommodity]) -> ()) {
        Alamofire.request(ServiceQueries.allGoods).responseArray { (response: DataResponse<[MapCommodity]>) in
            if let error = response.error {
                print("error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            }
            
            if let goods = response.result.value {
                self.goods = goods
                DispatchQueue.main.async {
                    comletion(goods)                    
                }
            }
        }
    }
}
