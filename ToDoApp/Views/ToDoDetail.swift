//
//  ToDoDetail.swift
//  ToDoApp
//
//  Created by Baltazar Servin on 26/10/25.
//

import SwiftUI

struct ToDoDetail: View {
    @EnvironmentObject var toDoList: ToDoList
    @Binding var toDo: ToDo
    @State var showingAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 36) {
            Text(toDo.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Due for \(toDo.dueDate, style: .date)")
                .font(.headline)
            Text(toDo.description)
            
            Button {
                toDoList.toggle(toDo.id)
                dismiss()
            } label: {
                Text("Mark as \(toDo.isCompleted ? "Incomplete" : "Complete")")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 50)
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .padding(.horizontal, 40)
            .padding(.top, 8)
            
            HStack {
                Spacer()
                Button {
                    showingAlert = true
                } label: {
                    Text("Delete To-Do")
                }
                .tint(.black)
                .underline(true)
                .alert("This action is final", isPresented: $showingAlert) {
                    Button("Delete", role: .destructive) {
                        toDoList.remove(id: toDo.id)
                        dismiss()
                    }
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("Are you sure you want to delete this To-Do?")
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal, 50)
    }
}

#Preview {
    ToDoDetail(
        toDo: .constant(ToDo(title: "Test1", description: "This is a test", dueDate: Date()))
    )
}
