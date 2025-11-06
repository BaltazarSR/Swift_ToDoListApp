//
//  ContentView.swift
//  ToDoApp
//
//  Created by Baltazar Servin on 26/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentView: Int = 0
    
    var body: some View {
        Button {
            currentView = 2
        } label: {
            UserView()
        }
        .tint(Color.black)
        TabView(selection: $currentView) {
            ToDoView()
                .tabItem {
                    Label("To Do List", systemImage: "list.bullet")
                }
                .tag(0)
            
            AddToDoView()
                .tabItem {
                    Label("New To Do", systemImage: "plus")
                }
                .tag(1)
            if currentView == 2 {
                ChangeUserView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .tag(2)
            }
        }
        .tint(Color(.black))
    }
}

#Preview {
    ContentView()
        .environmentObject(ToDoList())
}
