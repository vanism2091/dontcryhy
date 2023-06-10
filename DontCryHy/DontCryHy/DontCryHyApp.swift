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
            NavigationStack {
                MainView()
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
