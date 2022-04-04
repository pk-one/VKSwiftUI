//
//  DateFormatter.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 29.03.2022.
//

import Foundation

extension DateFormatter {
    static let postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, HH:mm"
        return formatter
    }()
}
