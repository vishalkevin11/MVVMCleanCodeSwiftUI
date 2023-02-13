//
//  UserService.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Combine
import Foundation

protocol UserServiceProtocol: AnyObject {
    var httpProtocol: HttpClientProtocol { get }
    
    func getUsers() -> AnyPublisher<Users, Error>
    func getUsers(limit: Int, pageIndex: Int) -> AnyPublisher<Users, Error>
    func getUserDetails(userId: String) -> AnyPublisher<User, Error>
}

final class UserService: UserServiceProtocol {
    var httpProtocol: HttpClientProtocol
    
    init(httpProtocol: HttpClientProtocol = HttpClient()) {
        self.httpProtocol = httpProtocol
    }
    
    func getUsers() -> AnyPublisher<Users, Error> {
        let endpoint = APIEndpoint.users
        return httpProtocol.get(type: Users.self, url: endpoint.url, headers: endpoint.headers)
    }
    
    func getUsers(limit: Int, pageIndex: Int) -> AnyPublisher<Users, Error> {
        let endpoint = APIEndpoint.users(limit: limit, pageIndex: pageIndex)
        return httpProtocol.get(type: Users.self, url: endpoint.url, headers: endpoint.headers)
    }
    
    func getUserDetails(userId: String) -> AnyPublisher<User, Error> {
        let endpoint = APIEndpoint.userDetails(userId: userId)
        return httpProtocol.get(type: User.self, url: endpoint.url, headers: endpoint.headers)
    }
    
    
}
