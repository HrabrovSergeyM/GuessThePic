//
//  GameOverView.swift
//  GuessThePic
//
//  Created by Sergey Hrabrov on 08.07.2023.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var matchManager: MatchManager
    @State var scoreGradientColor = LinearGradient(colors: [.green, .yellow], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("gameOver2")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 40)
                .padding(.vertical)

            Text("Score \(matchManager.score)")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(scoreGradientColor)
            
            Spacer()
            
            Button {
                print("Start")
            } label: {
                Text("Menu")
                    .foregroundColor(.white)
                    .foregroundStyle(scoreGradientColor)
                    .font(.largeTitle)
                    .bold()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 100)
            
            
            Text(matchManager.authenticationState.rawValue)
                .font(.headline.weight(.semibold))
                .foregroundColor(.white)
                .padding()
            
            Spacer()
            
            
        }
        .background(
            Image("gameOverBg")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.1)
        )
        .ignoresSafeArea()
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(matchManager: MatchManager())
    }
}
