//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//

import FirebaseFirestore
import Foundation

// ViewModel for list of items view
// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false // by default is false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete 
    /// (Command + Option + / ) short cut key
    ///
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
