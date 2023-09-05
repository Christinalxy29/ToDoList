//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/4/23.
//

import FirebaseCore
import SwiftUI


@main
struct ToDoListAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
