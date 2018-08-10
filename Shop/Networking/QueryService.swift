//
//  QueryService.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 25.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

enum RequestMethod: String {
    case put
    case post
    case delete
}

class QueryService {
    
    //MARK: - Properties
    let session = URLSession(configuration: .default)
    
    //MARK: - Private Methods
    
    //GET - request
    private func query(to url: URL, completion: @escaping (Data) -> ()) {
        
        let dataTask = session.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                print("error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            } else if let data = data, let responce = responce as? HTTPURLResponse, responce.statusCode == 200 {
                completion(data)
            }
        }
        dataTask.resume()
    }
    
    //MARK: - Methods
    func updateEntity<T: Codable>(from url: URL, completion: @escaping (T) -> ()) {
        query(to: url) { (data) in
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(object)                    
                }
            } catch {
                print("decoding error: \(error)" + "\n" + "description: \(error.localizedDescription)")
            }
        }
    }
    
    func createRequest(to url: URL, body: Data, method: RequestMethod) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        if method != .delete {
            request.httpBody = body
        }
        
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
