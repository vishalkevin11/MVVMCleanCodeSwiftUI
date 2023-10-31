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
            List(viewModel.users.data, id: \.id) { user in
                NavigationLink {
                    UsersRouter.showUserDetailsView(user: user)
                } label: {
                    HStack {
                        Text("User ID: \(user.id ?? "-")")
                        Text("\(user.firstName ?? "-")")
                        Text("\(user.lastName ?? "-")")
                    }
                    
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

// struct UsersView_Previews: PreviewProvider {
//    static var previews: some View {
//        UsersView()
//    }
// }
