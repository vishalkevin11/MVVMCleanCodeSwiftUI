//
//  MoreInfoConfigurator.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 16/02/23.
//

import Foundation


final class MoreInfoConfigurator {
    
    static func getMoreInfoView(with user: User) -> MoreInfoView {
        return MoreInfoView(moreInfoViewModel: MoreInfoViewModel(with: user))
    }
}
