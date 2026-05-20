//
//  MyBookTrackerApp.swift
//  MyBookTracker
//
//  Created by Apple on 20/05/2026.
//

import SwiftUI
import SwiftData

@main
struct MyBookTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            BookList()
        }.modelContainer(for: Book.self)
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
