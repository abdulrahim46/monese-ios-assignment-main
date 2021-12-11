//
//  APIMockResources.swift
//  AssignmentTests
//
//  Created by Abdul Rahim on 11/12/21.
//

import Foundation

@testable import Assignment

class ApiMockResources: DataProvider {
    
    /// mock func for get launches
    func request<T>(urlName: ServiceURLType, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        
        let urlString = URLManager.getUrlString(for: urlName)
        let completeUrl = URL(string: urlString)
        guard let url = completeUrl else {
            completion(.failure(NetworkManager.CustomError.invalidUrl))
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NetworkManager.CustomError.invalidData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // fetch json data
    func fetchLaunchesfromJson(completion: @escaping ([Launch]) -> ()) {
            let l = Launch(flightNumber: 1, name: "aaa", time: "123", success: true, rocket: "22344", details: "succeed", links: nil)
            let l2 = Launch(flightNumber: 2, name: "bbb", time: "555", success: true, rocket: "22344", details: "succeed", links: nil)
            let l3 = Launch(flightNumber: 3, name: "ccc", time: "777", success: true, rocket: "22344", details: "succeed", links: nil)
            return completion([l,l2,l3])
    }
}
