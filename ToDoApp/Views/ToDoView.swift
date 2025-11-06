//
//  ToDoView.swift
//  ToDoApp
//
//  Created by Baltazar Servin on 26/10/25.
//

import SwiftUI

struct ToDoBanner: View {
    let toDo: ToDo
    var body: some View {
        
        HStack(spacing: 14) {
            Image(systemName: toDo.isCompleted ? "circle.fill" : "circle")
            Text(toDo.title)
                .font(.system(size: 24))
                .fontWeight(.medium)
            Spacer()
            Text(formatDate(toDo.dueDate))
                .font(.subheadline)
        }
        .padding(.horizontal, 50)
        .foregroundStyle(
            Calendar.current.startOfDay(for: toDo.dueDate) < Calendar.current.startOfDay(for: Date()) && !toDo.isCompleted
            ? Color.red
            : Color.black
        )
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: date)
    }
}

struct ToDoView: View {
    @EnvironmentObject var toDoList: ToDoList
    @State private var selectedToDo: ToDo? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 36) {
                    ForEach(toDoList.toDos) { toDoElement in
                        ToDoBanner(toDo: toDoElement)
                            .onTapGesture {
                                selectedToDo = toDoElement
                            }
                    }
                }
                .sheet(item: $selectedToDo) { toDo in
                    if let i = toDoList.toDos.firstIndex(where: { element in
                        element.id == toDo.id
                    }) {
                        ToDoDetail(toDo: $toDoList.toDos[i])
                            .padding()
                    } else {
                        Text("Item not found")
                            .padding()
                    }
                }
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    ToDoView()
        .environmentObject(ToDoList(toDos: [
            ToDo(title: "Test1", description: "Hello this is a test", dueDate: Date()),
            ToDo(title: "Test2", description: "Hello this is a test", dueDate: Date()),
            ToDo(title: "Test3", description: "Hello this is a test", dueDate: Date())
        ]))
}
