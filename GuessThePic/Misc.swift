//
//  Misc.swift
//  GuessThePic
//
//  Created by Sergey Hrabrov on 08.07.2023.
//

import Foundation

let everydayObjects = ["pen", "paper", "book", "table", "chair", "computer"]

enum PlayerAuthState: String {
case authenticating = "Logging in to Game Center..."
case unauthenticated = "Please sign in to Game Center."
case authenticated = ""
case error = "There was an error loggong into Game Canter."
case restricted = "You're not allowed to play multiplayer games!"
}

struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}

let maxTimeRemaining = 100
