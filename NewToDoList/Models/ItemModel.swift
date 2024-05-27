//
//  ItemModel.swift
//  ToDoList
//
//  Created by Admin on 23.04.2024.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    
    let id: String = UUID().uuidString
    private(set) var title: String = ""
    private(set) var isComplete: Bool = false
    
    mutating func changeIsComplete() {
        isComplete.toggle()
    }
}

