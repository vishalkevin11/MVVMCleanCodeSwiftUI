//
//  MoreInfoViewModel.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 14/02/23.
//

import Combine
import Foundation

class MoreInfoViewModel: ObservableObject {
 
    public var user: User
    
    init(with user: User) {
        self.user = user
    }
    
    var firstName: String {
        user.firstName ?? "--"
    }
    
    var lastName: String {
        user.lastName ?? "--"
    }
    
    var title: String {
        user.title ?? "--"
    }

}
