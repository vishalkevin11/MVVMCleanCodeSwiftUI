//
//  AppUtility.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 01/03/23.
//

import Foundation

final class AppUtility {

    static let shared = AppUtility()
    private init() {}

    var infoPlistData: Data? {
        let url = Bundle.main.url(forResource: "Info", withExtension: "plist")!
        return try? Data(contentsOf: url)
    }

    private enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
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
