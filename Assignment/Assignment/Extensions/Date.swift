//
//  Date.swift
//  Assignment
//
//  Created by Abdul Rahim on 10/12/21.
//

import Foundation

extension String {
    func dateOnly(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date1 = dateFormatter.date(from: date)
        return "\(date1 ?? Date())"
    }
}
