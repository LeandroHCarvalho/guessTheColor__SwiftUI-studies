//
//  TargetAndGuessRectView.swift
//  GuessTheColor
//
//  Created by Leandro Carvalho on 03/06/23.
//

import SwiftUI

struct TargetAndGuessRectView: View {
    
    @Binding var redTarget: Double
    @Binding var greenTarget: Double
    @Binding var blueTarget: Double
    @Binding var redGuess: Double
    @Binding var greenGuess: Double
    @Binding var blueGuess: Double
    @Binding var pickerLevelIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                // target rectangle
                VStack {
                    Rectangle()
                        .foregroundColor(Color(red: redTarget, green: greenTarget, blue: blueTarget, opacity: 1.0))
                        .cornerRadius(5)
                        .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 0))
                        .frame(height: 40)
                    
                    Text("Color to Match")
                        .bold()
                }
                // guess retangle
                VStack {
                    if pickerLevelIndex == 0 {
                        Rectangle()
                            .foregroundColor(Color(red: redGuess, green: greenTarget, blue: blueTarget, opacity: 1.0))
                            .modifier(rectModfier())
                    }
                    if pickerLevelIndex == 1 {
                        Rectangle()
                            .foregroundColor(Color(red: redGuess, green: greenGuess, blue: blueTarget, opacity: 1.0))
                            .modifier(rectModfier())
                    }
                    if pickerLevelIndex == 2 {
                        Rectangle()
                            .foregroundColor(Color(red: redGuess, green: greenGuess, blue: blueGuess, opacity: 1.0))
                            .modifier(rectModfier())
                    }
                    
                    HStack {
                        Image(systemName: "r.circle.fill")
                            .foregroundColor(.red)
                        Text("\(Int(redGuess * 255.0))")
                            .font(.callout)
                        
                        Image(systemName: "g.circle.fill")
                            .foregroundColor(.green)
                        Text("\(Int(greenGuess * 255.0))")
                            .font(.callout)
                        
                        Image(systemName: "b.circle.fill")
                            .foregroundColor(.blue)
                        Text("\(Int(blueGuess * 255.0))")
                            .font(.callout)
                    }
                    
                }
            }
        }
        
    }
    
}


struct rectModfier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(5)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            .frame(height: 40)
    }
}



struct TargetAndGuessRectView_Previews: PreviewProvider {
    static var previews: some View {
        TargetAndGuessRectView(redTarget: .constant(0.1), greenTarget: .constant(0.2), blueTarget: .constant(0.2), redGuess: .constant(0.2), greenGuess: .constant(0.1), blueGuess: .constant(0.7), pickerLevelIndex: .constant(2)).previewLayout(.fixed(width: 475, height: 200))
    }
}
