//
//  AppDelegate.swift
//  AIExpenseTracker
//
//  Created by Akshat Gandhi on 05/11/24.
//

import Foundation
import Firebase
import FirebaseFirestore

#if os(macOS)
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupFirebase()
    }
    
}
#else
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFirebase()
        return true}
}

#endif

fileprivate func isPreviewRuntime() -> Bool {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}

fileprivate func setupFirebase() {
    FirebaseApp.configure()
    if isPreviewRuntime() {
        let settings = Firestore.firestore().settings
        settings.host = "localhost:8080"
        settings.cacheSettings = PersistentCacheSettings(sizeBytes: NSNumber(value: FirestoreCacheSizeUnlimited))
        settings.isSSLEnabled = false
        Firestore.firestore().settings = settings
    }
}
