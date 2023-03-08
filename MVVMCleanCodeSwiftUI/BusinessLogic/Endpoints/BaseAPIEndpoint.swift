//
//  APIEndpoint.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 12/02/23.
//

import Foundation

protocol BaseAPIEndpoint {
    var httpMethod: HttpMethod { get }
    var path: String { get }
    var headers: [String: Any]? { get }
    var body: [String: Any]? { get }
    var queryParameters: [URLQueryItem]? { get }
}

extension BaseAPIEndpoint {
    //    // a default extension that creates the full URL
    //    var url: String {
    //        return baseURLString + path
    //    }
    var httpMethod: HttpMethod {
        return .get
    }
    
    var body: [String: Any]? {
        return nil
    }

    var scheme: String {
        return "https"
    }
    
    // host or base url
    var host: String? {
        //        switch BuildConfiguration.shared.environment {
        //        case .debugDevelopment, .releaseDevelopment:
        //            return "dummyapi.io"
        //        case .debugStaging, .releaseStaging:
        //            return "dummyapi.io"
        //        case .debugProduction, .releaseProduction:
        //            return "dummyapi.io"
        //        }
        AppConstants.apiHost
    }

    var basePath: String {
        AppConstants.apiPath ?? ""
    }

    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = basePath + path
        components.queryItems = queryParameters

        print("Host is \(host)")
        
        guard let url = components.url else {
            preconditionFailure("Invalid Componenets \(components)")
        }
        return url
    }
    
    var headers: [String: Any]? {
        return [
            "app-id": AppConstants.fakeStoreApiKey ?? ""
        ]
    }
}

// struct APIEndpoint {
//    var path: String
//    var queryParameters: [URLQueryItem] = []
// }
//
// protocol APIEndpoint {
//    var path: String { get set }
//    var queryParameters: [URLQueryItem] = [] { get set }
// }
