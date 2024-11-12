//
//  ExpenseLogItemView.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 10/11/24.
//

import SwiftUI

struct ExpenseLogItemView: View {
    
    let log: ExpenseFields
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        switch horizontalSizeClass {
        case .compact:
            compactView
        default:
            regularView
        }
    }
    
    var compactView: some View {
        HStack(spacing: 16) {
            CategoryImageView(category: log.categoryEnum)
            VStack(alignment: .leading, spacing: 8) {
                Text(log.name.capitalized)
                    .font(.headline)
                Text(log.dateText)
                    .font(.subheadline)
            }
            Spacer()
            Text(log.amountText)
                .font(.headline)
        }
        .padding(.horizontal)
    }
    
    var regularView: some View {
        HStack(spacing: 16) {
            CategoryImageView(category: log.categoryEnum)
            Spacer()
            Text(log.name)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text(log.amountText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text(log.dateText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text(log.categoryEnum.rawValue)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}

#Preview {
    VStack {
        ForEach([ExpenseFields(id: "1", name: "franky", category: "Food", amount: 100, date: .now), ExpenseFields(id: "2", name: "Electricity", category: "Utilities", amount: 1150, date: .now)]) { log in
            ExpenseLogItemView(log: log)
        }
        
    }
}
