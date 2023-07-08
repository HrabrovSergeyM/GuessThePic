//
//  MatchManager.swift
//  GuessThePic
//
//  Created by Sergey Hrabrov on 08.07.2023.
//

import Foundation

class MatchManager: ObservableObject {
    @Published var authenticationState = PlayerAuthState.authenticating
    
    @Published var inGame = false
    @Published var isGameOver = false
    
    @Published var currentlyDrawing = false
    @Published var drawPrompt = ""
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
}
