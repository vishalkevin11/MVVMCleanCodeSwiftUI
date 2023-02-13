//
//  UsersView.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject var viewModel: UsersViewModel
    var body: some View {
        NavigationView {
            List(viewModel.users.data) { user in
                NavigationLink {
                    UsersRouter.showUserDetailsView(user: user)
                } label: {
                    Text("\(user.title)")
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

//struct UsersView_Previews: PreviewProvider {
//    static var previews: some View {
//        UsersView()
//    }
//}
