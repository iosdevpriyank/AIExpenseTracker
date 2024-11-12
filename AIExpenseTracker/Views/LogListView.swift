//
//  LogListView.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 12/11/24.
//

import FirebaseFirestore
import SwiftUI


struct LogListView: View {
    @FirestoreQuery(collectionPath: "logs",predicates: [.order(by: SortType.date.rawValue, descending: true)]) private var dbLogs: [ExpenseFields]
    
                                                         
    @Binding var vm: ExpenseListVM
    
    var body: some View {
        listView
            .sheet(item: $vm.logToEdit, onDismiss: { vm.logToEdit = nil }) { log in
                Text(log.name)
            }
            .overlay {
                if dbLogs.isEmpty {
                    Text("No expenses data\nPlease add your expenses using the add button")
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .padding(.horizontal)
                }
            }
            .onChange(of: vm.sortType) { updateQuery() }
            .onChange(of: vm.sortOrder) { updateQuery() }
            .onChange(of: vm.selectedCategories) { updateQuery() }
            
    }
                                 
    var listView: some View {
        #if os(iOS)
                List {
                    ForEach(dbLogs) { log in
                        ExpenseLogItemView(log: log)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                vm.logToEdit = log
                            }
                            .padding(.vertical, 4)
                    }
                    .onDelete(perform: self.onDelete)
                }
                .listStyle(.plain)
        #else
        ZStack {
            ScrollView {
                ForEach(dbLogs) { log in
                    VStack {
                        ExpenseLogItemView(log: log)
                        Divider()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .padding(.horizontal)
                    .onTapGesture {
                        vm.logToEdit = log
                    }
                    .contextMenu {
                        Button("Edit") {
                            self.vm.logToEdit = log
                        }
                        Button("Delete") {
                            self.vm.db.delete(log: log)
                        }
                    }
                    
                }
            }
            .contentMargins(.vertical, 8, for: .scrollContent)
        }
        #endif
    }
        
    func updateQuery() {
        $dbLogs.predicates = vm.predicates
    }
    private func onDelete(with indexSet: IndexSet) {
        indexSet.forEach { index in
            let log = dbLogs[index]
            vm.db.delete(log: log)
        }
    }
}
                                 
#Preview {
        @Previewable @State var vm: ExpenseListVM = ExpenseListVM()
        return LogListView(vm: $vm)
}
