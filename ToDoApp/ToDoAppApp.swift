//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Baltazar Servin on 26/10/25.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    @StateObject var toDoList: ToDoList = ToDoList()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(toDoList)
            
        }
    }
}
