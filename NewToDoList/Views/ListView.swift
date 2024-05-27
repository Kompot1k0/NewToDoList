//
//  ListView.swift
//  ToDoList
//
//  Created by Admin on 18.04.2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var model: ListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.items) { item in
                    ListRowItem(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                model.changeIsComplete(item)
                            }
                        }
                }
                .onDelete (perform: model.deleteItem )
                .onMove(perform: model.moveItem )
            }
            .background(
                BackgroundView()
            )
            .listStyle(.plain)
            .navigationTitle("ToDo List 📝")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .padding()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add",
                        destination: AddView()
                    )
                    .padding()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }.environmentObject(ListViewModel())
    }
}
