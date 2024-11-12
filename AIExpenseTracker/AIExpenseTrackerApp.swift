//
//  AIExpenseTrackerApp.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 05/11/24.
//

import SwiftUI

@main
struct AIExpenseTrackerApp: App {
    
    #if os(macOS)
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    #else
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    #endif
        
    var body: some Scene {
        WindowGroup {
            ExpenseLogListContainerView
            #if os(macOS)
                .frame(minWidth: 728, minHeight: 480)
            #endif
        }
        #if os(macOS)
        .windowResizability(.contentMinSize)
        #endif
    }
}
