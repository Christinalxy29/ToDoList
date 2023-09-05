//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name  = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage  = ""
   
    
    init(){}
    
    func register(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        // those database are stored in a collection in the document
        
        // have a collection for user
        
        db.collection("users")
            .document(id) // pass in the user id
            .setData(newUser.asDictionary()) // it takes a dictionary in
        
        
        
    }
    
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            return false
        }
         
        // restriction with the password length
        guard password.count >= 6 else{
            return false
        }
        return true
    }
}
