//
//  HomeViewModel.swift
//  Assignment
//
//  Created by Abdul Rahim on 10/12/21.
//

import Foundation

class HomeViewModel {
    
    var launches: [Launch]?
    var apiResource: DataProvider
    
    init(apiResource: DataProvider = NetworkManager()) {
        self.apiResource = apiResource
    }
    
    //MARK: fetch all launches from server
    func getAllLaunches() {
        apiResource.request(urlName: .launches, expecting: [Launch].self) { [weak self] result in
            switch result {
            case .success(let launches):
                self?.launches = launches
            case .failure(let error):
                AlertBuilder.failureAlertWithMessage(message: error.localizedDescription)
            }
        }
    }
}
