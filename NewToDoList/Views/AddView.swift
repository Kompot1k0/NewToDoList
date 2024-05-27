//
//  AddView.swift
//  ToDoList
//
//  Created by Admin on 18.04.2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var model: ListViewModel
    
    @State private var textFieldText: String = ""
    
    @State private var isAlert: Bool = false
    @State private var alertText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background {
                        Color(uiColor: .secondarySystemBackground)
                    }
                    .cornerRadius(10)
                    .padding(.vertical)
                Button(action: { saveButtonAction()
                }, label: {
                    Text("SAVE")
                        .applyButtonStyle()
                })
            }
            .padding()
            .alert(alertText,
                   isPresented: $isAlert,
                   actions: { Text("OK") })
            
        }.navigationTitle("Add a task 🖊")
            .background(
                BackgroundView()
            )
    }
    
    private func saveButtonAction() {
        if checkIfTextIsAppropriate() {
            model.addNewItem(title: textFieldText)
            dismiss()
        }
    }
    
    private func checkIfTextIsAppropriate() -> Bool {
        let result: Bool
        
        if textFieldText.count < 3 {
            result = false
            alertText = "Input must be longer than 3 symbols"
            isAlert = true
        } else {
            result = true
        }
        
        return result
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }.environmentObject(ListViewModel())
    }
}
