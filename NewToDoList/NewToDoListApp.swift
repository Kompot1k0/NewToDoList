//
//  NewToDoListApp.swift
//  NewToDoList
//
//  Created by Admin on 27.05.2024.
//

import SwiftUI

@main
struct NewToDoListApp: App {
    @StateObject var model = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }.environmentObject(model)
        }
    }
}
