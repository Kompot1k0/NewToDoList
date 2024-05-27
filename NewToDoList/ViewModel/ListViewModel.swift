//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Admin on 21.05.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    private var defaultItems: [ItemModel] = [
        ItemModel(title: "First item", isComplete: false),
        ItemModel(title: "Second item", isComplete: true),
        ItemModel(title: "Third item", isComplete: false),
    ]
    
    init() {
        let newValue = [
            ItemModel(title: "First item", isComplete: false),
            ItemModel(title: "Second item", isComplete: true),
            ItemModel(title: "Third item", isComplete: false),
        ]
        items.append(contentsOf: newValue)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addNewItem(title: String) {
        items.append(ItemModel(title: title))
    }
    
    func changeIsComplete(_ item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].changeIsComplete()
        }
    }
}
