//
//  SelecetdSortOrderView.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 07/11/24.
//

import SwiftUI

struct SelecetdSortOrderView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Binding var selectedSortOrder: SortOrder
    @Binding var selectedSortType: SortType
    
    private let sortTypes = SortType.allCases
    private let sortOrders = SortOrder.allCases
    
    var body: some View {
        HStack {
            #if !os(macOS)
            Text("Sort By:")
            #endif
            
            Picker("Sort By", selection: $selectedSortType) {
                ForEach(sortTypes) { type in
                    if horizontalSizeClass == .compact {
                        Image(systemName: type.systemNameIcon)
                            .tag(type)
                    } else {
                        Text(type.rawValue.capitalized)
                            .tag(type)
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            
            #if !os(macOS)
            Text("Sort Order:")
            #endif

            Picker("Sort Order", selection: $selectedSortOrder) {
                ForEach(sortOrders) { order in
                    if horizontalSizeClass == .compact {
                        Image(systemName: order.systemNameIcon)
                            .tag(order)
                    } else {
                        Text(order.rawValue.capitalized)
                            .tag(order)
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
        .frame(height: 64)
    }
}

#Preview {
    @Previewable @State var vm = ExpenseListVM()
    return SelecetdSortOrderView(selectedSortOrder: $vm.sortOrder, selectedSortType: $vm.sortType)
}
