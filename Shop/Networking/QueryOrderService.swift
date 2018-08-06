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
    var orders: [Order] = []
    
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
    
    //MARK: - Methods
    func updateOrders(completion: @escaping () -> ()) {
        guard let url = URL(string: ServiceQueries.userOrders) else { return }
        updateEntity(from: url) { (orders: [Order]) in
            self.orders = orders
            completion()
        }
    }
}
