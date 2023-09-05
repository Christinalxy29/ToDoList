//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/4/23.
//

import SwiftUI

struct MainView: View {
    // check if the user sign in
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        }else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        // signed in
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
