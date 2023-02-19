//
//  AppErrors.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Foundation

enum AppError: Error {
    case network
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}

extension AppError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .decode:
            return "Inavld Data"
        case .network:
            return "Unable to reach network"
        default:
            return "Unknown error"
        }
    }
}
