//
//  User.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: String?
    var title: String?
    var firstName: String?
    var lastName: String?
    var picture: String?
}

extension User {
    static func mockUser() -> Self {
        return User(id: "mock_id", title: "mock_title", firstName: "mock_firstName", lastName: "mock_lastName", picture: "mock_pic")
    }
}
