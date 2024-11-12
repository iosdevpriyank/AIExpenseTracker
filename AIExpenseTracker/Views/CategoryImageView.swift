//
//  CategoryImageView.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 07/11/24.
//

import SwiftUI

struct CategoryImageView: View {
    
    let category: ExpenseCategory
    
    var body: some View {
        Image(systemName: category.systemIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 8)
            .foregroundStyle(category.color)
            .background(category.color.opacity(0.1))
            .cornerRadius(18)
    }
}

#Preview {
    CategoryImageView(category: .education)
}
