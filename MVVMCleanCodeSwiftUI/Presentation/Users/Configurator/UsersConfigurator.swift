//
//  UsersConfigurator.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Foundation

final class UsersConfigurator {
    public static func configureUsersView(forViewModel viewModel: UsersViewModel = UsersViewModel()) -> UsersView {
        return UsersView(viewModel: viewModel)
    }
}
