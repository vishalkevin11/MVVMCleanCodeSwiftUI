//
//  AppConfiguration.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 01/03/23.
//

import Foundation

final class AppConfiguration {

    static let shared = AppConfiguration()

    var environment: AppEnvironment

    private init() {
        guard let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String else {
            environment = AppEnvironment(rawValue: "Debug")!
            return
        }
        environment = AppEnvironment(rawValue: currentConfiguration)!
        print("Current configuration: \(environment.rawValue)")
        let bundleID = Bundle.main.bundleIdentifier
        print("bundleID: \(bundleID)")
    }
}
