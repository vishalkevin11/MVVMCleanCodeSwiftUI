//
//  APIEndpoint.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 12/02/23.
//

import Foundation

struct APIEndpoint {
    var path: String
    var queryParameters: [URLQueryItem] = []
}

//protocol APIEndpoint {
//    var path: String { get set }
//    var queryParameters: [URLQueryItem] = [] { get set }
//}

