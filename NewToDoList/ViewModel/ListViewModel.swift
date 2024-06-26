//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Admin on 21.05.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "Items_list"
    
    init() {
        getItems()
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
    
    func getItems() {
        guard
            let data = UserDefaults().data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        items = savedItems
    }
    
    func saveItems() {
        guard let encodedData = try? JSONEncoder().encode(items) else { return }
        UserDefaults().set(encodedData, forKey: itemsKey)
    }
}
