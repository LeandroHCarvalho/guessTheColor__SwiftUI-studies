//
//  GuessTheColorApp.swift
//  GuessTheColor
//
//  Created by Leandro Carvalho on 23/05/23.
//

import SwiftUI

@main
struct GuessTheColorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(redGuess: 0.5, greenGuess: 0.5, blueGuess: 0.5)
        }
    }
}
