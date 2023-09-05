//
//  User.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval // Represent when did the user sign up
    
    // convert anything codable into a dictionary
}
