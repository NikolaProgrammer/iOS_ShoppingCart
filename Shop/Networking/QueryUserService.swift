//
//  QueryUserService.swift
//  Shop
//
//  Created by Nikolay Sereda on 01.08.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

class QueryUserService {
    
    //MARK: Shared instance
    static let shared = QueryUserService()
    
    //MARK: Properties
    var user: User!
    private let session = URLSession(configuration: .default)
    
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
    
    //MARK: Private Methods
    private func updateUser(data: Data) {
        do {
            user = try JSONDecoder().decode([User].self, from: data).first
        } catch {
            fatalError("No such user")
        }
    }
}
