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
    @State var target: Int = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    
    struct LabelStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
            
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            
        }
    }
    struct ValueStyle: ViewModifier{
    func body(content: Content) -> some View {
        return content
        
        
        .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        
        }
    }
    
    struct Shadow: ViewModifier{
    func body(content: Content) -> some View {
        return content
        
        .foregroundColor(Color.yellow)
        .modifier(Shadow())
        .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    struct ButtonLargeTextStyle: ViewModifier{
    func body(content: Content) -> some View {
        return content
        
        .foregroundColor(Color.black)
        
        .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    struct ButtonSmallTextStyle: ViewModifier{
    func body(content: Content) -> some View {
        return content
        
        .foregroundColor(Color.black)
        
        .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target Row
            HStack {
                Text("Put the bullseye as close as you can to: ") .modifier(LabelStyle())
                    
                Text("\(target)") .modifier(ValueStyle())
                    
            }
            Spacer()
            
            // Slider row
            HStack{
                Text("1") .modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100) .accentColor(Color.green)
                Text("100") .modifier(LabelStyle())
                
            }
            Spacer()
            //Button row
            
            
            Button(action: {
                print("Button Pressed!")
                self.alertIsVisible = true
                
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/) .modifier(ButtonLargeTextStyle())
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                let roundedValue: Int = Int(sliderValue.rounded())
                return Alert(title: Text(alertTitle()),
                             message: Text("The Slider value is \(roundedValue). \n" +
                                "You scored \(PointsForCurrentRound()) points this round."
                ),         dismissButton: .default(Text("Awesome!")) {
                    self.score = self.score + self.PointsForCurrentRound()
                    self.target = Int.random(in: 1...100)
                    self.round = self.round + 1
                    })
            }
            .background(Image("Button")) .modifier(Shadow())
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    HStack{
                Image("StartOverIcon")
                Text("Start Over") .modifier(ButtonSmallTextStyle())
                    }
                }
                
            .background(Image("Button")) .modifier(Shadow())


                Spacer()
                Text("Score:") .modifier(LabelStyle())
                Text("\(score)") .modifier(ValueStyle())
                Spacer()
                Text("Round:") .modifier(LabelStyle())
                Text("\(round)") .modifier(ValueStyle())
                Spacer()
                
                NavigationLink(destination: AboutView()) {
                HStack {
                Image("InfoIcon")
                Text("Info") .modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button")) .modifier(Shadow())
                
            }
            .padding(.bottom, 20)
    }
        .background(Image("Background"), alignment: .center)
    .accentColor(midnightBlue)
    .navigationBarTitle("Bullseye")
        
}
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    
    func PointsForCurrentRound() -> Int {
        
        
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
        
    }
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Great Job"
        } else if difference < 5{
            title = "Close"
        }else if difference <= 10{
            title = "Little more Effort Needed"
        } else {
            title = "You are Better than that"
        }
        return title
    }
    
    func startNewGame () {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() .previewLayout(
            .fixed(width: 896, height: 414))
    }
}
}
