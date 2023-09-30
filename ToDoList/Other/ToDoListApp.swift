//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Khant Zaw Win on 30/9/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
