//
//  QueryService.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

fileprivate enum RequestType: String {
    case put
    case post
}

class QueryService {
    
    //MARK: Shared instance
    static let shared = QueryService()
    
    //MARK: Properties
    private let session = URLSession(configuration: .default)

    private var goods: [Commodity] = []
    var user: User!
    
    //MARK: Private initializators
    private init() {}
    
    //MARK: GET-Requests
    func queryUser(completion: @escaping (User?) -> ()) {
        guard let url = URL(string: ServiceQueries.getUser) else { return }
        
        let dataTask = session.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                print("error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            } else if let data = data, let responce = responce as? HTTPURLResponse, responce.statusCode == 200 {
                self.updateUser(data: data)
                DispatchQueue.main.async {
                    completion(self.user)
                }
            }
        }
        dataTask.resume()
    }
    
    func queryGoods(query: String, completion: @escaping ([Commodity]?) -> ()) {
        guard let url = URL(string: query) else {
            return
        }
        
        let dataTask = session.dataTask(with: url){ (data, responce, error) in
            if let error = error {
                print("error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            } else if let data = data, let responce = responce as? HTTPURLResponse, responce.statusCode == 200 {
                self.updateGoods(data: data)
                DispatchQueue.main.async {
                    completion(self.goods)
                }
            }
        }
        
        dataTask.resume()
    }

    //MARK: PUT-Request
    func putUser() {
        do {
            let JSONData = try JSONEncoder().encode(user)
            let url = URL(string: "http://localhost:3000/users/\(user.id)")!
            
            let request = createRequest(type: .put, body: JSONData, url: url)
            session.dataTask(with: request).resume()
        } catch {
            print("Cannot encode user in JSON: \(error)" + "\n" + "description: \(error.localizedDescription)")
            return
        }
    }
    
    //MARK: Private Methods
    private func createRequest(type: RequestType, body: Data, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpBody = body
        request.httpMethod = type.rawValue.uppercased()
        
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    private func updateUser(data: Data) {
        do {
            user = try JSONDecoder().decode([User].self, from: data).first
        } catch {
            fatalError("No such user")
        }
    }
    
    private func updateGoods(data: Data) {
        do {
            goods = try JSONDecoder().decode([Commodity].self, from: data)
        } catch {
            print("decoding error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            goods = []
        }
    }
}
