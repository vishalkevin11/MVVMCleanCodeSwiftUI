//
//  UsersViewModel.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Combine
import Foundation

class UsersViewModel: ObservableObject {
    @Published public var users: Users = Users(data: [])
    
    private var userService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(users:Users = Users(data: []), userService: UserServiceProtocol = UserService()) {
        self.users = users
        self.userService = userService
    }
    
    public func onAppear() {
        getUsers(limit: 20, pageIndex: 0)
    }
    
    private func getUsers(limit: Int, pageIndex: Int) {
        userService.getUsers(limit: limit, pageIndex: pageIndex)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}
