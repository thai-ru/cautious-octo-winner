//
//  BirthDaysApp.swift
//  BirthDays
//
//  Created by Robinson Thairu on 14/04/2024.
//

import SwiftUI
import SwiftData

@main
struct BirthDaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
