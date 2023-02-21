//
//  Users.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Foundation

struct Users: Decodable {
    var data: [User]
    private enum CodingKeys: String, CodingKey {
        case data
    }
}
