//
//  FilterExpenseCategoriesView.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 06/11/24.
//

import SwiftUI

struct FilterExpenseCategoriesView: View {
    
    @Binding var selectedExpenseCategories: Set<ExpenseCategory>
    private let categories = ExpenseCategory.allCases
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(categories) { category in
                        FilterButtonView(category: category, isSelected: self.selectedExpenseCategories.contains(category), onTap: onTap)
                    }
                }
                .padding(.horizontal)
            }
            
            if selectedExpenseCategories.count > 0 {
                Button(role: .destructive) {
                    self.selectedExpenseCategories.removeAll()
                } label: {
                    Text("Category Filter: \(self.selectedExpenseCategories.count)")
                }
            }
        }
    }
    
    func onTap(_ category: ExpenseCategory) {
        if selectedExpenseCategories.contains(category) {
            selectedExpenseCategories.remove(category)
        } else {
            selectedExpenseCategories.insert(category)
        }
    }
    
}

struct FilterButtonView: View {
    var category: ExpenseCategory
    var isSelected: Bool
    var onTap: (ExpenseCategory) -> Void
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: category.systemIcon)
            Text(category.rawValue.capitalized)
                .fixedSize(horizontal: true, vertical: true)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? category.color : Color.gray, lineWidth: 1)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(isSelected ? category.color : Color.clear)
                }
        }
        .frame(height: 44)
        .onTapGesture {
            self.onTap(category)
        }
        .foregroundStyle(isSelected ? .white : .black)
    }
}

#Preview {
    @Previewable @State var vm = ExpenseListVM()
    return FilterExpenseCategoriesView(selectedExpenseCategories: $vm.selectedCategories)
}
