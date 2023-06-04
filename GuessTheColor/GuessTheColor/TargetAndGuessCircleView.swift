//
//  TargetAndGuessCircleView.swift
//  GuessTheColor
//
//  Created by Leandro Carvalho on 23/05/23.
//

import SwiftUI

struct TargetAndGuessCircleView: View {
    
    @Binding var redTarget: Double
    @Binding var greenTarget: Double
    @Binding var blueTarget: Double
    @Binding var redGuess: Double
    @Binding var greenGuess: Double
    @Binding var blueGuess: Double
    @Binding var pickerLevelIndex: Int
    
    var body: some View {
        ZStack {
            // guess circle
            if pickerLevelIndex == 0 {
                Circle()
                    .fill(Color(red: redGuess, green: greenTarget, blue: blueTarget, opacity: 1.0))
                    .frame(height: 200)
            }
            if pickerLevelIndex == 1 {
                Circle()
                    .fill(Color(red: redGuess, green: greenGuess, blue: blueTarget, opacity: 1.0))
                    .frame(height: 200)
            }
            if pickerLevelIndex == 2 {
                Circle()
                    .fill(Color(red: redGuess, green: greenGuess, blue: blueGuess, opacity: 1.0))
                    .frame(height: 200)
            }
            
            // Target Circle
            Circle()
                .fill(Color(red: redTarget, green: greenTarget, blue: blueTarget, opacity: 1.0))
                .frame(height: 80)
        }.onAppear {
            self.redGuess = 0.0
            self.greenGuess = 0.0
            self.blueGuess = 0.0
        }
        
    }
}

struct TargetAndGuessCircleView_Previews: PreviewProvider {
    static var previews: some View {
        TargetAndGuessCircleView(redTarget: .constant(0.1), greenTarget: .constant(0.2), blueTarget: .constant(0.2), redGuess: .constant(0.9), greenGuess: .constant(0.1), blueGuess: .constant(0.7), pickerLevelIndex: .constant(2)).previewLayout(.fixed(width: 300, height: 300))
    }
}
