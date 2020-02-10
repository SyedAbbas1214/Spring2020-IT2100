//
//  ContentView.swift
//  Bullseye-App
//
//  Created by Syed ali Abbas on 2/5/20.
//  Copyright © 2020 Syed ali Abbas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target Row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text(/*@START_MENU_TOKEN@*/"100"/*@END_MENU_TOKEN@*/)
                    
            }
            Spacer()
            
            // Slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            //Button row
            
            
            Button(action: {
                print("Button Pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                var roundedValue: Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello There"),
                             message: Text("The Slider value is \(roundedValue)."),
                             dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            
            // Score row
            HStack {
                Button(action: {}) {
                Text("Start Over")
            }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                          
                }
        }
            .padding(.bottom, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() .previewLayout(
            .fixed(width: 896, height: 414))
    }
}
}
