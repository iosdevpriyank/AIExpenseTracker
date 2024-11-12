//
//  SortEnum.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 06/11/24.
//

import Foundation

enum SortType: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    case date
    case amount
    case name
    
    var systemNameIcon: String {
        switch self {
        case .date:
            return "calendar"
        case .amount:
            return "dollarsign.circle"
        case .name:
            return "person.crop.circle"
        }
    }
}

enum SortOrder: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    case ascending
    case descending
    
    var systemNameIcon: String {
        switch self {
        case .ascending:
            return "arrow.up"
        case .descending:
            return "arrow.down"
        }
    }
}
