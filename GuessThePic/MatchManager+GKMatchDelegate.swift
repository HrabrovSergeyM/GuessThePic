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
        <#code#>
    }
    
}
