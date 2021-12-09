//
//  HomeViewModel.swift
//  Assignment
//
//  Created by Abdul Rahim on 10/12/21.
//

import Foundation

class HomeViewModel {
    
    var mobiles: [Launch]?
    var apiResource: DataProvider
    
    init(apiResource: DataProvider = NetworkManager()) {
        self.apiResource = apiResource
        //getAllLaunches()
    }
    
    //MARK: fetch all launches from server
    func getAllLaunches(completion: @escaping ([Launch]?, Error?) -> Void) {
        apiResource.request(urlName: .launches, expecting: [Launch].self) { [weak self] result in
            switch result {
            case .success(let mobiles):
                completion(mobiles, nil)
                self?.mobiles = mobiles
            case .failure(let error):
                completion(nil,error)
                //AlertBuilder.failureAlertWithMessage(message: error.localizedDescription)
            }
        }
    }
}
