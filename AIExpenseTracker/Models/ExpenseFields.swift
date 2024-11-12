//
//  ExpenseFields.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 06/11/24.
//

import Foundation

struct ExpenseFields: Codable, Identifiable, Equatable {
    
    let id: String
    var name: String
    var category: String
    var amount: Double
    var currency: String
    var date: Date
    
    var categoryEnum: ExpenseCategory  {
        ExpenseCategory(rawValue: category) ?? .utilities
    }
    
    init(id: String, name: String, category: String, amount: Double, currency: String = "₹", date: Date) {
        self.id = id
        self.name = name
        self.category = category
        self.amount = amount
        self.currency = currency
        self.date = date
    }
}

extension ExpenseFields {
    
    var dateText: String {
        Utility.dateFormatter.string(from: date)
    }
    
    var amountText: String {
        Utility.numberFormatter.currencySymbol = currency
        return Utility.numberFormatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}

