//
//  ToDoListItemsViewViewModel.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for single todolist item view (each row in items list) 
// Primary tab
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item // since item is constant, we need to create a new var
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
        
    }
}
