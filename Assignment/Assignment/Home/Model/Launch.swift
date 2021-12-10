import Foundation

struct Launch: Codable {
    let flightNumber: String?
    let name: String?
    let time: String?
    let success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case flightNumber
        case name
        case time = "date_utc"
        case success
    }
}
