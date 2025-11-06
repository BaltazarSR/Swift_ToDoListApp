//
//  ToDoList.swift
//  ToDoApp
//
//  Created by Baltazar Servin on 26/10/25.
//

import Foundation
import Combine

struct ToDo: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var dueDate: Date
    var isCompleted: Bool
    
    init(title: String, description: String, dueDate: Date) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.isCompleted = false
    }
}

final class ToDoList : ObservableObject {
    @Published var toDos: [ToDo] = [] {
        didSet { save() }
    }
    
    private let filename = "todos-json"
    
    private var fileURL: URL {
        let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return folder.appendingPathComponent(filename)
    }
    
    init() {
        load()
    }
    
    init(toDos: [ToDo]) {
        self.toDos = toDos
    }
    
    // MARK: - Persistence
    func save() {
        do {
            let data = try JSONEncoder().encode(toDos)
            try data.write(to: fileURL, options: [.atomic])
            print("Saved to \(fileURL)")
        } catch {
            print("Save error: \(error)")
        }
    }
    
    func load() {
        do {
            let data = try Data(contentsOf: fileURL)
            toDos = try JSONDecoder().decode([ToDo].self, from: data)
            print("Loaded from file")
        } catch {
            print("No saved file yet or decode error: \(error)")
        }
    }
    
    // MARK: - Helpers
    func add(todo: ToDo) {
        toDos.append(todo)
    }

    func remove(id: UUID) {
        toDos.removeAll { $0.id == id }
    }

    func toggle(_ id: UUID) {
        guard let i = toDos.firstIndex(where: { $0.id == id }) else { return }
        toDos[i].isCompleted.toggle()
    }
    
}
