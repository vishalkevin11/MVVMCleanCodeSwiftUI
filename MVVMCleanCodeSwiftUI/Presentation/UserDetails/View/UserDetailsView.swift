//
//  UserDetailsView.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Combine
import SwiftUI

struct UserDetailsView: View {
    
    @ObservedObject var viewModel: UsersViewModel
    var body: some View {
       // NavigationStack(path: SwiftUI.Binding<SwiftUI.NavigationPath>, root: <#T##() -> Root#>)
        
        NavigationView {
            List(viewModel.users.data) { user in
                NavigationLink {
                    UsersRouter.showUserDetailsView(user: user)
                } label: {
                    Text("\(user.title)")
                }

            }
        }
    }
}

//struct UserDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailsView()
//    }
//}
