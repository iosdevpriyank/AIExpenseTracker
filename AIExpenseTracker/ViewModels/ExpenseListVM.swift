//
//  ExpenseListVM.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 06/11/24.
//

import SwiftUI
import Observation
import Foundation
import FirebaseFirestore

@Observable
class ExpenseListVM {
    
    let db = DatabaseManager.shared
    
    var sortType: SortType = .date
    var sortOrder: SortOrder = .descending
    var selectedCategories = Set<ExpenseCategory>()
    
    var isLogFormPresented: Bool = false
    var logToEdit: ExpenseFields?
    
    var predicates: [QueryPredicate] {
        var predicates = [QueryPredicate]()
        if selectedCategories.count > 0 {
            predicates.append(.whereField("category", isIn: Array(selectedCategories).map { $0.rawValue }))
        }
        
        predicates.append(.order(by: sortType.rawValue, descending: sortOrder == .descending ? true : false))
        return predicates
    }
}
