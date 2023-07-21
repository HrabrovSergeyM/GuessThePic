//
//  ContentView.swift
//  GuessThePic
//
//  Created by Sergey Hrabrov on 08.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var matchManager = MatchManager()
    
    var body: some View {
        ZStack {
            
            if matchManager.isGameOver {
                GameOverView(matchManager: matchManager)
            } else if matchManager.inGame {
                GameView(matchManager: matchManager)
            } else {
                MenuView(matchManager: matchManager)
            }
            
            
        } // ZStack
        .onAppear {
            matchManager.authenticateUser()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
