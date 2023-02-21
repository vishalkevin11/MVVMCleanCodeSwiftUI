//
//  HttpClient.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 12/02/23.
//

import Combine
import Foundation

protocol HttpClientProtocol: AnyObject {
    typealias Headers = [String: Any]?
    func getData(url: URL, headers: Headers) -> AnyPublisher<Data, URLError>
    func get<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T: Decodable
}

final class HttpClient: HttpClientProtocol {
    func getData(url: URL, headers: Headers) -> AnyPublisher<Data, URLError> {
        var urlRequest = URLRequest(url: url)
        if let headers = headers {
            headers.forEach { (key: String, value: Any) in
                if let value = value as? String {
                    urlRequest.setValue(value, forHTTPHeaderField: key)
                }
            }
        }
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
    
    func get<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T: Decodable {
        var urlRequest = URLRequest(url: url)
        if let headers = headers {
            headers.forEach { (key: String, value: Any) in
                if let value = value as? String {
                    urlRequest.setValue(value, forHTTPHeaderField: key)
                }
            }
        }
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
