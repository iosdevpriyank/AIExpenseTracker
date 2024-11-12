//
//  Utility.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 06/11/24.
//
import Foundation

struct Utility {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        return formatter
    }()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        return formatter
    }()
}

