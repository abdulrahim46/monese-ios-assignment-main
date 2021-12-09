//
//  DataProvider.swift
//  Assignment
//
//  Created by Abdul Rahim on 10/12/21.
//

import Foundation

protocol DataProvider {
    func request<T: Codable>(urlName:ServiceURLType, expecting: T.Type, completion: @escaping(Result<T, Error>) -> Void)
}
