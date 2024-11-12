//
//  ExpenseCategory.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 06/11/24.
//

import Foundation
import SwiftUI

import SwiftUI

enum ExpenseCategory: String, Identifiable, CaseIterable {
    case food = "Food"
    case transportation = "Transportation"
    case entertainment = "Entertainment"
    case healthcare = "Healthcare"
    case utilities = "Utilities"
    case shopping = "Shopping"
    case education = "Education"
    case travel = "Travel"
    case others = "Others"
    
    // Unique identifier for each category
    var id: String { rawValue }
    
    // SF Symbols icon for each category
    var systemIcon: String {
        switch self {
        case .food: return "fork.knife"
        case .transportation: return "car"
        case .entertainment: return "gamecontroller"
        case .healthcare: return "heart.text.square"
        case .utilities: return "lightbulb"
        case .shopping: return "cart"
        case .education: return "book"
        case .travel: return "airplane"
        case .others: return "questionmark.circle"
        }
    }
    
    // Color for each category
    var color: Color {
        switch self {
        case .food: return .red
        case .transportation: return .blue
        case .entertainment: return .orange
        case .healthcare: return .pink
        case .utilities: return .yellow
        case .shopping: return .green
        case .education: return .purple
        case .travel: return .teal
        case .others: return .gray
        }
    }
}

