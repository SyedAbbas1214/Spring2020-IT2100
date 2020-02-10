//
//  ContentView.swift
//  Knock-Knock Joke
//
//  Created by Syed ali Abbas on 2/5/20.
//  Copyright © 2020 Syed ali Abbas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    @State var whosThereIsVisible: Bool = false
    var body: some View {
        VStack {
            Text("Syed Abbas")
                .fontWeight (.semibold)
                .foregroundColor(Color.green)
            
            
            Button(action: {
                print("Button Pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello There"),
                             message: Text("This is my First pop-up."),
                             dismissButton: .default(Text("Awesome!")))
            }
            Button(action: {
                self.whosThereIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Knock, Knock!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $whosThereIsVisible) { () -> Alert in
                return Alert(title: Text("Who's There?"),
                             message: Text("Hawaii!"),
                             dismissButton: .default(Text("Hawaii who?")))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
