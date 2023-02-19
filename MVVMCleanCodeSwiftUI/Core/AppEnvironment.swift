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
    
    init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String
        
        environment = AppEnvironment(rawValue: currentConfiguration)!
    }
}
