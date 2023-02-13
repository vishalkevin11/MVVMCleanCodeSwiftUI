//
//  AppErrors.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Foundation

enum AppError: Error {
case networkError
case dataInvalid
}

extension AppError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .dataInvalid:
            return "Inavld Data"
        case .networkError:
            return "Unable to reach network"
        }
    }
}
