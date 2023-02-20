//
//  AppEnvironment.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 17/02/23.
//

import Foundation

enum AppEnvironment: String {
    case debugDevelopment = "Debug Development"
    case releaseDevelopment = "Release Development"

    case debugStaging = "Debug Staging"
    case releaseStaging = "Release Staging"

    case debugProduction = "Debug Production"
    case releaseProduction = "Release Production"
}

class BuildConfiguration {
    static let shared = BuildConfiguration()
    
    var environment: AppEnvironment
    
    private init() {
        guard let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String else {
            environment = AppEnvironment(rawValue: "Debug Development")!
            return
        }
        environment = AppEnvironment(rawValue: currentConfiguration)!
        print("Current configuration: \(environment.rawValue)")
    }
}
