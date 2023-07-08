//
//  GameView.swift
//  GuessThePic
//
//  Created by Sergey Hrabrov on 08.07.2023.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    @State var drawingGuess = ""
    @State var eraserEnabled = ""
    
    func makeGuess() {
        
    }
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(matchManager.currentlyDrawing ? "drawBg" : "guessBg")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                //                    .scaleEffect(1.1)
                VStack {
                    topBar
                    
                    ZStack {
                        
                    }
                    
                }
            }
        }
    }
    
    var topBar: some View {
        ZStack {
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "arrowshape.turn.up.left.circle.fill")
                        .font(.largeTitle)
                        .tint(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
                }
                
                Spacer()
                
                Label("\(matchManager.remainingTime)",
                      systemImage: "clock.fill")
                .bold()
                .font(.title2)
                .foregroundColor(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
                
            }
        }
        .padding(.vertical, 15)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(matchManager: MatchManager())
    }
}
