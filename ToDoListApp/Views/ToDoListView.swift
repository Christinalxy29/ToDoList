//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        // underscore _ represents the property wrapper
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }

    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemsView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                  //Action
                    viewModel.showingNewItemView = true
                    // when it tabs the button, it need change the default value
                }label:{
                   Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
