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

    //MARK: - Methods
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
