//
//  EmptyListView.swift
//  NewToDoList
//
//  Created by Admin on 27.05.2024.
//

import SwiftUI

struct EmptyListView: View {
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Text("No task left 🥳")
                .font(.title)
                .fontWeight(.semibold)
            Text("Add something important so you don't forget 😉")
                .padding()
            NavigationLink(
                destination: AddView(),
                label: {
                    Text("Add task")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.indigo : Color.accentColor)
                        .cornerRadius(10)
                        .shadow(
                            color: animate ? Color.indigo.opacity(0.7) : Color.accentColor.opacity(0.4),
                            radius: animate ? 5 : 10,
                            x: 0,
                            y: animate ? 10 : 30)
                        .offset(y: animate ? 30 : 10)
                }
            )
            Spacer()
        }
        .frame(maxWidth: 400)
        .multilineTextAlignment(.center)
        .padding()
        .onAppear {
            addAnimation()
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EmptyListView()
        }.navigationTitle("Some title")
    }
}
