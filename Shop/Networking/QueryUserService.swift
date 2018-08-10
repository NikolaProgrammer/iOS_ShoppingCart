//
//  QueryUserService.swift
//  Shop
//
//  Created by Nikolay Sereda on 01.08.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import Foundation

class QueryUserService: QueryService {
    
    //MARK: Shared instance
    static let shared = QueryUserService()
    
    //MARK: - Properties
    var user = User(id: 0, name: "Guest", purchases: [])
    
    //MARK: - Private initializators
    override private init() { }
    
    //MARK: - PUT-Request
    func updateUser() {
        do {
            let JSONData = try JSONEncoder().encode(user)
            let url = URL(string: "http://localhost:3000/users/\(user.id)")!
            
            let request = createRequest(to: url, body: JSONData, method: .put)
            session.dataTask(with: request).resume()
        } catch {
            print("Cannot encode user in JSON: \(error)" + "\n" + "description: \(error.localizedDescription)")
            return
        }
    }
    
    //MARK: - Methods
    func updateUser(completion: @escaping () -> ()) {
        guard let url = URL(string: ServiceQueries.getUser) else { return }
        
        updateEntity(from: url) { (users: [User]) in
            self.user = users.first!
            completion()
        }
    }
}
