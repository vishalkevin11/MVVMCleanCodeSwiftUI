//
//  NewsAPIEndpoint.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Foundation

// struct NewsAPIEndpoint: APIEndpoint {
// struct APIEndpoint {
//   fileprivate var path: String
//    fileprivate var queryParameters: [URLQueryItem] = []
// }

// extension BaseAPIEndpoint {
//
//    var url: URL {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "dummyapi.io"
//        components.path = "/data/v1" + path
//        components.queryItems = queryParameters
//        
//        guard let url = components.url else {
//            preconditionFailure("Invalid Componenets \(components)")
//        }
//        return url
//    }
//    
//    var headers:[String : Any] {
//        return [
//            "app-id": "63e680fbd40ebb998caea60f"
//        ]
//    }
// }

enum NewsAPIEndpoint: BaseAPIEndpoint {
    case getAllUsers
    case getUsers(limit: Int, pageIndex: Int)
    case getuserDetails(userId: String)
    
    var path: String {
        switch self {
        case .getAllUsers, .getUsers:
            return "/user"
        case .getuserDetails(let userId):
            return "/user/\(userId)"
        }
    }

    var queryParameters: [URLQueryItem]? {
        switch self {
        case .getUsers(let limit, let pageIndex):
            return [URLQueryItem(name: "limit", value: "\(limit)"), URLQueryItem(name: "page", value: "\(pageIndex)")]
        default:
            return nil
        }
    }
    
    //    static var users: Self {
    //        return NewsAPIEndpoint(path: "/user")
    //    }
    //
    //    static func users(limit: Int, pageIndex:Int) -> Self {
    //        return NewsAPIEndpoint(path: "/user",queryParameters: [URLQueryItem(name: "limit", value: "\(limit)"), URLQueryItem(name: "page", value: "\(pageIndex)")])
    //    }
    //
    //    static func userDetails(userId: String) -> Self {
    //        return NewsAPIEndpoint(path: "/user/\(userId)")
    //    }
}
