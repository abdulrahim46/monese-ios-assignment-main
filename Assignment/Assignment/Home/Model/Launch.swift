import Foundation

struct Launch: Codable {
    let flightNumber: String?
    let name: String?
    let time: String?
    let success: Bool?
    let rocket: String?
    let details: String?
    let links: Link?
    
    enum CodingKeys: String, CodingKey {
        case flightNumber
        case name
        case time = "date_utc"
        case success
        case rocket
        case details
        case links
    }
}

struct Link: Codable {
    let wikipedia: String?
    let article: String?
    
    enum CodingKeys: String, CodingKey {
        case wikipedia
        case article
    }
}
