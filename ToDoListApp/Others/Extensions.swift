//
//  Extensions.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/7/23.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:] // if the action fail, it returns an empty dictionary
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
