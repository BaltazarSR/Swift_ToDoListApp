//
//  UserView.swift
//  ToDoApp
//
//  Created by Baltazar Servin on 29/10/25.
//

import SwiftUI


struct UserView: View {
    
    @AppStorage("user.name") private var name = ""
    @AppStorage("user.lastname") private var lastName = ""
    @AppStorage("user.profilePic") private var profilePic = ""
    
    var body: some View {
        VStack {
            if name == "" || lastName == "" {
                Text("Add user information")
                    .font(.title)
                    .fontWeight(.bold)
            } else {
                Image(profilePic)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .cornerRadius(100)
                Text("\(name) \(lastName)")
                    .font(Font.largeTitle)
                    .fontWeight(Font.Weight.bold)
            }
        }
        .padding(.top, 50)
    }
}

#Preview {
    UserView()
}
