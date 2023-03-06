//
//  MVVMCleanCodeSwiftUIApp.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 12/02/23.
//

import SwiftUI
// import AppCenter

@main
struct MVVMCleanCodeSwiftUIApp: App {

    init() {

    }

    var body: some Scene {
        WindowGroup {
            UsersConfigurator.configureUsersView()
        }
    }
}
