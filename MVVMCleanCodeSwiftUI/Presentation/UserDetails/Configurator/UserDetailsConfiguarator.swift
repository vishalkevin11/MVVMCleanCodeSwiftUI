//
//  UserDetailsConfiguarator.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 13/02/23.
//

import Foundation

final class UserDetailsConfiguarator {
    static func configureUserDetailView(with user: User) -> UserDetailsView {
        return UserDetailsView(viewModel: UserDetailsViewModel(user: user))
    }
}
