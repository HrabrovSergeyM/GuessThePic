//
//  MenuView.swift
//  GuessThePic
//
//  Created by Sergey Hrabrov on 08.07.2023.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    @State var logoGradientColors: [Color] = [.purple, .yellow, .pink, .purple]
    @State private var animateGradient: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            //            Image("logo")
            //                .resizable()
            //                .scaledToFit()
            //                .padding(30)
            Text("Guess What")
                .font(Font.system(size: 84, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .mask(
                    LinearGradient(
                        gradient: Gradient(colors: logoGradientColors),
                        startPoint: animateGradient ? .leading : .trailing,
                        endPoint: animateGradient ? .trailing : .leading
                    )
                )
                .animation(
                    Animation.linear(duration: 3)
                        .repeatForever(autoreverses: false)
                )
                .onAppear() {
                    animateGradient = true
                }
            
            
            Spacer()
            
            Button {
                print("Start")
            } label: {
                Text("PLAY")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
            }
            .disabled(matchManager.authenticationState != .authenticated || matchManager.inGame)
            .padding(.vertical, 20)
            .padding(.horizontal, 100)
            .background(
                Capsule(style: .circular)
                    .fill(matchManager.authenticationState != .authenticated || matchManager.inGame
                          ? .gray : Color("primaryYellow"))
                
            )
            
            Text(matchManager.authenticationState.rawValue)
            //                .font(.headline.weight(.semibold))
                .font(Font.system(size: 20, weight: .semibold))
                .padding()
                .foregroundStyle(
                    LinearGradient(colors: [.yellow, .purple, .yellow, .yellow], startPoint: .leading, endPoint: .trailing)
                )
            
            Spacer()
            
            
        }
        .background(
            Image("menuBg")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.1)
        )
        .ignoresSafeArea()
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(matchManager: MatchManager())
    }
}
