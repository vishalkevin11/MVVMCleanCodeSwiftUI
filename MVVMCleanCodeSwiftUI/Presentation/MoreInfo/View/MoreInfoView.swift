//
//  MoreInfoView.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 14/02/23.
//

import Combine
import SwiftUI

struct MoreInfoView: View {
    
    @ObservedObject var moreInfoViewModel: MoreInfoViewModel
    
    var body: some View {
        VStack {
            Text("First Name \(moreInfoViewModel.firstName)")
            Text("Last Name \(moreInfoViewModel.lastName)")
            Text("Title \(moreInfoViewModel.title)")
        }
    }
}

//struct MoreInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoreInfoView()
//    }
//}
