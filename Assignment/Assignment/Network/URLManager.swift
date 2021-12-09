//
//  URLManager.swift
//  Assignment
//
//  Created by Abdul Rahim on 10/12/21.
//

import Foundation

struct URLManager {
    
    static let kBaseURL = "https://api.spacexdata.com"
    static let kAPIVersion = "/v4/"
    
    static func getUrlString(for serviceEnum: ServiceURLType)-> String {
        switch serviceEnum {
        case .launches:
            return kBaseURL + kAPIVersion + "launches"
        }
    }
    
}


enum ServiceURLType {
    case launches
}
