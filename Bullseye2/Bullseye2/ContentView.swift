//
//  ContentView.swift
//  Bullseye2
//
//  Created by Syed ali Abbas on 3/31/20.
//  Copyright © 2020 Syed ali Abbas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var whosThereIsVisible: Bool = false
    var body: some View {
        VStack {
            Text("Welcome to my first app!")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            
            Button(action: {
                print("Button Pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("Hello there!"),
                             message: Text("This is my first pop up."), dismissButton: .default(Text("Awesome!")))
            
            }
            Button(action: {
                self.whosThereIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Knock, Knock!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $whosThereIsVisible) { () ->
                Alert in
                return Alert(title: Text("Who's there?"),
                             message: Text("Nobel."),
                             dismissButton: .default(Text("No bel, That's why i knocked!")))
            
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
