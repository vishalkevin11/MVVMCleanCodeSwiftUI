//
//  UserImageService.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Combine
import Foundation


protocol UserImageServiceProtocol: AnyObject {
    var httpClientProtocol : HttpClientProtocol { get }
    
    func getUserProfileImage(url urlString: String) -> AnyPublisher<Data, Error>
}


final class UserImageService: UserImageServiceProtocol {
    var httpClientProtocol: HttpClientProtocol
    
    
    init(httpClientProtocol: HttpClientProtocol = HttpClient()) {
        self.httpClientProtocol = httpClientProtocol
    }
    
    func getUserProfileImage(url urlString: String) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: urlString) else {
            return Fail<Data, Error>(error: AppError.network).eraseToAnyPublisher()
        }
        
        return httpClientProtocol.getData(url: url, headers: [:])
            .mapError { _ in AppError.decode }
            .eraseToAnyPublisher()
    }
    
    
}
