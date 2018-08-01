//
//  QueryService.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

class QueryGoodsService {
    
    //MARK: - Properties
    private let session = URLSession(configuration: .default)
    private var goods: [Commodity] = []
    

    //MARK: - GET-Requests
    func queryGoods(completion: @escaping ([Commodity]?) -> ()) {
        guard let url = URL(string: ServiceQueries.allGoods) else {
            return
        }
        
        let dataTask = session.dataTask(with: url) { data, responce, error in
            if let error = error {
                print("error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            } else if let data = data, let responce = responce as? HTTPURLResponse, responce.statusCode == 200 {
                self.updateGoods(from: data)
                DispatchQueue.main.async {
                    completion(self.goods)
                }
            }
        }
        
        dataTask.resume()
    }
        
    //MARK: - Private Methods
    private func updateGoods(from data: Data) {
        do {
            goods = try JSONDecoder().decode([Commodity].self, from: data)
        } catch {
            print("decoding error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            goods = []
        }
    }
}
