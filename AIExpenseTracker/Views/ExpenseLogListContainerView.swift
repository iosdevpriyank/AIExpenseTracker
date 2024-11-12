//
//  ExpenseLogListContainerView.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 12/11/24.
//

import SwiftUI

struct ExpenseLogListContainerView: View {
    
    @Binding var vm: ExpenseListVM
    
    var body: some View {
        VStack(spacing: 0) {
            FilterExpenseCategoriesView(selectedExpenseCategories: $vm.selectedCategories)
            Divider()
            SelecetdSortOrderView(selectedSortOrder: $vm.sortOrder, selectedSortType: $vm.sortType)
            Divider()
            LogListView(vm: $vm)
        }
        .toolbar {
            ToolbarItem {
                Button {
                    vm.isLogFormPresented = true
                } label: {
                    HStack {
                        Image(systemName: "plus")
                            .font(.headline)
                            .foregroundStyle(.black)
                        #if os(macOS)
                            Text("Add Expense")
                        #else
                            Text("Add")
                            .foregroundStyle(.black)
                        #endif
                    }
                }
            }
        }
        .sheet(isPresented: $vm.isLogFormPresented) {
            LogFormView()
        }
    }
}

#Preview {
    @Previewable @State var vm = ExpenseListVM()
    NavigationStack {
        ExpenseLogListContainerView(vm: $vm)
    }
}
