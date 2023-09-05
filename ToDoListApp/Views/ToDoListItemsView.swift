//
//  ToDoListItemsView.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?
                      "checkmark.circle.fill" : "circle")
                .foregroundColor(Color.purple)
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemsView(item:
                .init(id: "123",
                      title: "Homework",
                      dueDate: Date().timeIntervalSince1970,
                      createdDate: Date().timeIntervalSince1970,
                      isDone: true))
    }
}
