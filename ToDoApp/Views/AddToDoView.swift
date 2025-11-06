//
//  AddToDoView.swift
//  ToDoApp
//
//  Created by Baltazar Servin on 26/10/25.
//

import SwiftUI

struct AddToDoView: View {
    @EnvironmentObject var toDoList: ToDoList
    @State var title: String = ""
    @State var description: String = ""
    @State var dueDate: Date = Date()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: Title Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Title")
                        .font(.subheadline)
                        .padding(.leading, 50)
                    
                    TextField("", text: $title)
                        .padding(.horizontal, 14)
                        .frame(height: 48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(.black), lineWidth: 2)
                        )
                        .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 3)
                        .tint(.black)
                        .padding(.horizontal, 50)
                }
                
                // MARK: Description Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.subheadline)
                        .padding(.leading, 50)
                    
                    TextEditor(text: $description)
                        .padding(14)
                        .frame(height: 160)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(.black), lineWidth: 2)
                                .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 3)
                        )
                        .tint(.black)
                        .padding(.horizontal, 50)
                }
                
                // MARK: Date Picker
                DatePicker("Due date", selection: $dueDate, displayedComponents: .date)
                    .padding(.horizontal, 50)
                    .padding(.top, 20)
                    .tint(Color.black)
                
                // MARK: Add Button
                Button {
                    let tempTodo = ToDo(title: title, description: description, dueDate: dueDate)
                    toDoList.add(todo: tempTodo)
                } label: {
                    Text("Add To Do")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 50)
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .padding(.horizontal, 40)
                .padding(.top, 8)
                .opacity(
                    (title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                     description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    ? 0.5 : 1
                )
                .disabled(
                    title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                    description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                )
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .padding(.top, 50)
    }
}

#Preview {
    AddToDoView()
        .environmentObject(ToDoList())
}
