//
//  ListRowItem.swift
//  ToDoList
//
//  Created by Admin on 18.04.2024.
//

import SwiftUI

struct ListRowItem: View {
    
    var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplete ? .green : .red)
            Text(item.title)
                .font(.title2)
            Spacer()
        }
        .listRowBackground(Color.clear)
    }
}

struct ListRowItem_Previews: PreviewProvider {
    
    static var item1: ItemModel = ItemModel(title: "First row", isComplete: true)
    static var item2: ItemModel = ItemModel(title: "Second row", isComplete: false)
    
    static var previews: some View {
        Group {
            ListRowItem(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
