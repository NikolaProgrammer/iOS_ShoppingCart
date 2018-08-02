//
//  QueryOrderService.swift
//  Shop
//
//  Created by Nikolay Sereda on 02.08.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

class QueryOrderService: QueryService {
    //MARK: - Properties
    private let session = URLSession(configuration: .default)
    
    private var orders: [Order] = []
    
    //MARK: - GET-Requests
    func queryOrders(completion: @escaping ([Order]?) -> ()) {
        guard let url = URL(string: ServiceQueries.userOrders) else { return }
        
        let dataTask = session.dataTask(with: url){ (data, responce, error) in
            if let error = error {
                print("error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            } else if let data = data, let responce = responce as? HTTPURLResponse, responce.statusCode == 200 {
                self.updateOrders(with: data)
                DispatchQueue.main.async {
                    completion(self.orders)
                }
            }
        }
        dataTask.resume()
    }
    
    //MARK: - POST-Request
    func addOrder(_ order: Order) {
        do {
            let JSONData = try JSONEncoder().encode(order)
            guard let url = URL(string: ServiceQueries.orders) else { return }
            
            let request = createRequest(to: url, body: JSONData, method: .post)
            session.dataTask(with: request).resume()
        } catch {
            print("Cannot encode user in JSON: \(error)" + "\n" + "description: \(error.localizedDescription)")
            return
        }
    }
    
    //MARK: DELETE-Request
    func deleteOrder(_ order: Order) {
        do {
            let JSONData = try JSONEncoder().encode(order)
            guard let url = URL(string: ServiceQueries.orders + "/\(order.id)") else { return }
            
            let request = createRequest(to: url, body: JSONData, method: .delete)
            session.dataTask(with: request).resume()
        } catch {
            print("Cannot encode user in JSON: \(error)" + "\n" + "description: \(error.localizedDescription)")
            return
        }
    }
    
    //MARK: - Private Methods
    
    private func updateOrders(with data: Data) {
        do {
            orders = try JSONDecoder().decode([Order].self, from: data)
        } catch {
            print("decoding error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            orders = []
        }
    }
}
