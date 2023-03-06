//
//  AppConfiguration.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 01/03/23.
//

import Foundation

private enum AppConfigConstants: String {
    case API_BASE_HOST
    case FAKE_STORE_API_KEY
    case API_BASE_PATH
}

enum AppConstants {
    private enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    private static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

extension AppConstants {

    static var apiHost: String? {
        return try? AppConstants.value(for: AppConfigConstants.API_BASE_HOST.rawValue)
    }

    static var apiPath: String? {
        return try? AppConstants.value(for: AppConfigConstants.API_BASE_PATH.rawValue)

    }

    static var fakeStoreApiKey: String? {
        return try? AppConstants.value(for: AppConfigConstants.FAKE_STORE_API_KEY.rawValue)
    }
}
