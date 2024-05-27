//
//  BackgroundView.swift
//  ToDoList
//
//  Created by Admin on 16.05.2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [.teal, .red],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea(edges: .vertical)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
