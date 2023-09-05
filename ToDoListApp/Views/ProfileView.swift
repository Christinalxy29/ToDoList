//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user{
                    profile(user: user)
                } else {
                    Text("Loading Profile... ")
                        .bold()
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.purple)
            .frame(width: 125, height: 125)
        
        //Info: Name, Email, Member Since
        VStack(alignment: .leading){
            HStack {
                Text("Name: ")
                    .bold()
                    .foregroundColor(Color.purple)
                Text(user.name)
                    .foregroundColor(Color.yellow)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                    .foregroundColor(Color.purple)
                Text(user.email)
                    .foregroundColor(Color.yellow)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                    .foregroundColor(Color.purple)
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(Color.yellow)
            }
            .padding()
            
        }
        //Sign out
        Button("Log Out"){
            viewModel.logOut()
        }
        .bold()
        .tint(.purple)
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
