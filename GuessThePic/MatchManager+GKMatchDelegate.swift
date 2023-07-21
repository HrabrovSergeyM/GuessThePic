//
//  MatchManager+GKMatchDelegate.swift
//  GuessThePic
//
//  Created by Sergey Hrabrov on 21.07.2023.
//

import Foundation
import GameKit
import PencilKit

extension MatchManager: GKMatchDelegate {
    
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        let content = String(decoding: data, as: UTF8.self)
        
        if content.starts(with: "stringData:") {
            let message = content.replacing("stringData:", with: "")
            receivedString(message)
        } else {
            do {
                try lastReceivedDrawing = PKDrawing(data: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendString(_ message: String) {
        guard let encoded = "stringData:\(message)".data(using: .utf8) else { return }
        sendData(encoded, mode: .reliable)
    }
    
    func sendData(_ data: Data, mode: GKMatch.SendDataMode) {
        do {
            try match?.sendData(toAllPlayers: data, with: mode)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func match(_ match: GKMatch, player: GKPlayer, didChange state: GKPlayerConnectionState) {
        guard state == .disconnected && !isGameOver else { return }
        let alert = UIAlertController(title: "Player disconnected", message: "The other player disconnected from the game", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.match?.disconnect()
        })
        
        DispatchQueue.main.async {
            self.resetGame()
            self.rootViewController?.present(alert, animated: true)
        }
        
    }
    
}
