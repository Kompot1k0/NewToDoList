//
//  View+ButtonStyle.swift
//  NewToDoList
//
//  Created by Admin on 27.05.2024.
//

import SwiftUI

extension View {
    func applyButtonStyle() -> some View {
        self
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
            .shadow(color: Color(uiColor: .systemGray).opacity(0.7), radius: 10, x: 5, y: 10)
    }
}
