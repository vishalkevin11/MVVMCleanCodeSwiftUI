//
//  MVVMCleanCodeSwiftUIApp.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 12/02/23.
//

import SwiftUI

@main
struct MVVMCleanCodeSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            UsersConfigurator.configureUsersView()
        }
    }
}
