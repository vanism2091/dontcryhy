//
//  DontCryHyApp.swift
//  DontCryHy
//
//  Created by sei on 2023/06/07.
//

import SwiftUI

@main
struct DontCryHyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
