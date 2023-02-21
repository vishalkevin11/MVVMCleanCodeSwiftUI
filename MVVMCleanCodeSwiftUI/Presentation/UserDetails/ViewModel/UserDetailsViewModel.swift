//
//  UserDetailsViewModel.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by kevin vishal on 13/02/23.
//

import Combine
import SwiftUI
import Foundation

class UserDetailsViewModel: ObservableObject {
    @Published public var avatar: UIImage = UIImage()
    
    private var userImageService: UserImageService
    public var user: User
    private var cancellables = Set<AnyCancellable>()
    
    init(userImageService: UserImageService = UserImageService(), user: User) {
        self.userImageService = userImageService
        self.user = user
    }
    
    func onAppear() {
        getImageData()
    }
    
    private func getImageData() {
        guard let pictureUrl = user.picture else { return }
        userImageService.getUserProfileImage(url: pictureUrl)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error): print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] imageData in
                guard let image = UIImage(data: imageData) else { return }
                self?.avatar = image
            }
            .store(in: &cancellables)
    }
    
}
