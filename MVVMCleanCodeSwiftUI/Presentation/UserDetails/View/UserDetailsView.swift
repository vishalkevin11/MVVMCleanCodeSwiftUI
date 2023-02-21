//
//  UserDetailsView.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Combine
import SwiftUI

struct UserDetailsView: View {
    
    @ObservedObject var viewModel: UserDetailsViewModel
     @State private var showBottomSheet: Bool = false
    var body: some View {
        
        VStack {
            
            Image(uiImage: viewModel.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text("\(viewModel.user.firstName ?? "")")
            
            Button("More Info") {
                showBottomSheet = true
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .sheet(isPresented: $showBottomSheet) {
            MoreInfoConfigurator.getMoreInfoView(with: viewModel.user)
        }

    }
}

// struct UserDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailsView()
//    }
// }
