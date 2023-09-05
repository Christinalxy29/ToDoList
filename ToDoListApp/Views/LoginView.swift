//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack{
                // Header
                HeaderView(title: "To Do List", subtitle: "Smile & Get Things Done", angle: 15, background: .purple)
                
                // Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                     
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                        background: .yellow
                    ){
                        // Attempt log in
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .offset(y: -50)
                // Create Account
                VStack{
                    Text("New to the Cookie List?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
