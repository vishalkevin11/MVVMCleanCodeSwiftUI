//
//  NewsAPIEndpoint.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Foundation

//struct NewsAPIEndpoint: APIEndpoint {
extension APIEndpoint {

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dummyapi.io"
        components.path = "data/v1" + path
        components.queryItems = queryParameters
        
        guard let url = components.url else {
            preconditionFailure("Invalid Componenets \(components)")
        }
        return url
    }
    
    var headers:[String : Any] {
        return [
            "app-id": "63e680fbd40ebb998caea60f"
        ]
    }
}

extension APIEndpoint {
    static var users: Self {
        return APIEndpoint(path: "/user")
    }
    
    static func users(limit: Int, pageIndex:Int) -> Self {
        return APIEndpoint(path: "/user",queryParameters: [URLQueryItem(name: "limit", value: "\(limit)"), URLQueryItem(name: "page", value: "\(pageIndex)")])
    }
    
    static func userDetails(userId: String) -> Self {
        return APIEndpoint(path: "/user/\(userId)")
    }
}
