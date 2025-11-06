//
//  ChangeUserView.swift
//  ToDoApp
//
//  Created by Baltazar Servin on 29/10/25.
//

import SwiftUI

struct ChangeUserView: View {
    @AppStorage("user.name") private var name = ""
    @AppStorage("user.lastname") private var lastName = ""
    @AppStorage("user.profilePic") private var profilePic = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Name")
                    .font(.subheadline)
                    .padding(.leading, 50)
                
                TextField("", text: $name)
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
            VStack(alignment: .leading, spacing: 8) {
                Text("Last Name")
                    .font(.subheadline)
                    .padding(.leading, 50)
                
                TextField("", text: $lastName)
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
            VStack(alignment: .leading, spacing: 8) {
                Text("Image")
                    .font(.subheadline)
                    .padding(.leading, 50)
                
                TextField("", text: $profilePic)
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
        }
    }
}

#Preview {
    ChangeUserView()
}
