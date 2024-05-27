//
//  EmptyListView.swift
//  NewToDoList
//
//  Created by Admin on 27.05.2024.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack {
            Text("No task left 🥳")
                .font(.title)
                .fontWeight(.semibold)
            Text("Add something important so you don't forget 😉")
            NavigationLink(
                destination: AddView(),
                label: { Text("Add task")
                        .applyButtonStyle()
                }
            )
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EmptyListView()
        }.navigationTitle("Some title")
    }
}
