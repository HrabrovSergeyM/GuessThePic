//
//  MenuView.swift
//  GuessThePic
//
//  Created by Sergey Hrabrov on 08.07.2023.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    let gradientColors: [Color] = [.purple, .yellow, .pink, .purple]
    @State private var animationAmount: CGFloat = -1
    
    var body: some View {
        VStack {
            Spacer()

            ZStack {
                        Text("Guess\nWhat")
                            .font(.system(size: 96))
                            .fontWeight(.heavy)
                            .foregroundColor(.clear)
                            .multilineTextAlignment(.center)
                            .background(
                                GeometryReader { geometry in
                                    LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .init(x: 0, y: 0.5), endPoint: .init(x: 1, y: 0.5))
                                        .frame(width: geometry.size.width)
                                        .offset(x: geometry.size.width * animationAmount)
                                        .onAppear() {
                                            withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                                                animationAmount = 1
                                            }
                                        }
                                }
                            )
                            .mask(
                                Text("Guess\nWhat")
                                    .font(.system(size: 96))
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.center)
                            )

                        Text("Guess\nWhat")
                            .font(.system(size: 96))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .opacity(0.5)
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
