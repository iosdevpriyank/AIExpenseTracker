//
//  DatabaseManager.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 06/11/24.
//

import Foundation
import FirebaseFirestore

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
    
    private(set) lazy var logsCollection: CollectionReference = {
        let db = Firestore.firestore()
        return db.collection("logs")
    }()
    
    func add(log: ExpenseFields) throws {
        try logsCollection.document(log.id).setData(from: log)
    }
    
    func update(log: ExpenseFields) {
        logsCollection.document(log.id).updateData([
            "name": log.name,
            "amount": log.amount,
            "date": log.date,
            "category": log.category
        ])
    }
    
    func delete(log: ExpenseFields) {
        logsCollection.document(log.id).delete()
    }
}
