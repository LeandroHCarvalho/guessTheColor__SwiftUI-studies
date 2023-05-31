//
//  ContentView.swift
//  GuessTheColor
//
//  Created by Leandro Carvalho on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var redTarget = Double.random(in: 0..<1)
    @State var greenTarget = Double.random(in: 0..<1)
    @State var blueTarget = Double.random(in: 0..<1)
    @State var redGuess: Double
    @State var greenGuess: Double
    @State var blueGuess: Double
    @State var pickerLevelIndex = 2
//    @State var alertIsShown = false
    
//    @State private var scale: CGFloat = 1
    
    var body: some View {
        VStack {
            VStack {
                Text("Guess")
                    .foregroundColor(.red)
                    .fontWeight(.black)
                + Text(" The ")
                    .foregroundColor(.green)
                    .fontWeight(.black)
                + Text("Color")
                    .foregroundColor(.blue)
                    .fontWeight(.black)
            }.font(Font.system(size: 26, design: .serif))
            
            //add the target and guess circles
            TargetAndGuessCircleView(redTarget: $redTarget, greenTarget: $greenTarget, blueTarget: $blueTarget, redGuess: $redGuess, greenGuess: $greenGuess, blueGuess: $blueGuess, pickerLevelIndex: $pickerLevelIndex)
            
            //add the picker segment
            CreatePickerSegment(pickerLevelIndex: $pickerLevelIndex)
            
            //add the target and guess rectangles
//           TargetAndGuessRectView(redTarget: $redTarget, greenTarget: $greenTarget, blueTarget: $blueTarget, redGuess: $redGuess, greenGuess: $greenGuess, blueGuess: $blueGuess, pickerLevelIndex: $pickerLevelIndex)
//           Spacer()
           
           //add the sliders
          StyleTheSliders(redGuess: $redGuess, greenGuess: $greenGuess, blueGuess: $blueGuess, pickerLevelIndex: $pickerLevelIndex)
//           .scaleEffect(scale)
           .animation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5))
           
           Spacer()
            
            
        }
    }
    
    func calculateScore() -> Int  {
        let redDiff = redGuess - redTarget
        let greenDiff = greenGuess - greenTarget
        let blueDiff = blueGuess - blueTarget
        let easyDifference = sqrt(redDiff * redDiff)
        let hardDifference = sqrt(redDiff * redDiff + greenDiff * greenDiff)
        let goodLuckDifference = sqrt(redDiff * redDiff + greenDiff * greenDiff + blueDiff * blueDiff)
        
        var calculatedDifference = 0.0
        
        if pickerLevelIndex == 0 {
            calculatedDifference = easyDifference
        } else if pickerLevelIndex == 1 {
            calculatedDifference = hardDifference
        } else if pickerLevelIndex == 2 {
            calculatedDifference = goodLuckDifference
        }
        return Int((1.0 - calculatedDifference) * 100 + 0.5)
        
    }
    
    func reset() {
        redTarget = Double.random(in: 0..<1)
        greenTarget = Double.random(in: 0..<1)
        blueTarget = Double.random(in: 0..<1)
        redGuess = 0.0
        greenGuess = 0.0
        blueGuess = 0.0
    }
    
}

struct CreatePickerSegment: View {
    @Binding var pickerLevelIndex: Int
    @State private var levels = ["Easy", "Hard", "Good Luck!"]

    @State private var showSlider = false

    var body: some View {
        
        VStack {
            Text("Choose a difficulty level")
                .foregroundColor(.black)
                .font(.headline)
                .padding(.top)
                            
                Picker("Numbers", selection: $pickerLevelIndex) {
                    
                    ForEach(0 ..< levels.count) { index in
                        Text(self.levels[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.yellow)
                .cornerRadius(8)
                .padding(.horizontal)
                .shadow(color: Color.black, radius: 2, y: 4)
            
            Text("Difficulty Level: " + "\(levels[pickerLevelIndex])").bold()
                .padding()
        }
    }
}

struct CreateSlider: View {
    @Binding var value: Double

    var color: Color
    var body: some View {
        HStack {
            Text("0")
            .bold()
            .foregroundColor(color)
            
            Slider(value: $value, in: 0.0...1.0)
            Text("255")
            .bold()
            .foregroundColor(color)
        }.padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}

struct StyleTheSliders: View {
    
    @Binding var redGuess: Double
    @Binding var greenGuess: Double
    @Binding var blueGuess: Double
    @Binding var pickerLevelIndex: Int
    
    var body: some View {
        VStack {
            //red slider - this slider will always be visible
            CreateSlider(value: $redGuess, color: .red)
                .background(Capsule().stroke(Color.red, lineWidth: 3))
                .padding(.horizontal)
                .accentColor(.red)
                .padding(5)
            
            //green slider - shoiwn when the "Hard" option is selected
            if pickerLevelIndex == 1 {
                CreateSlider(value: $greenGuess, color: .green)
                .background(Capsule().stroke(Color.green, lineWidth: 4))
                .padding(.horizontal)
                .accentColor(.green)
                .padding(5)
            }
            
            //blue slider - this is shown when the "Good Luck" option is selected
            if pickerLevelIndex == 2 {
                CreateSlider(value: $greenGuess, color: .green)
                .background(Capsule().stroke(Color.green, lineWidth: 4))
                .padding(.horizontal)
                .accentColor(.green)
                .padding(5)
                
                CreateSlider(value: $blueGuess, color: .blue)
                .background(Capsule().stroke(Color.blue, lineWidth: 4))
                .padding(.horizontal)
                .accentColor(.blue)
                .padding(5)
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(redGuess: 0.5, greenGuess: 0.5, blueGuess: 0.5)
    }
}
