//
//  GameViewModel.swift
//  NimGame
//
//  Created by Samir Mestari on 10/08/2020.
//

import Foundation
import Combine
import SwiftUI

class GameViewModel: ObservableObject {
    
    @AppStorage("maxMatches") private var maxMatches: Int = 20
    @Published var matches: [Int] = []
    @Published var currentPlayer: Player
    @Published var winner:Player?
    @Published var showAlert = false
    
    var alertMessage: String = ""
    
    var columns: [GridItem] {
        return gatColumns()
    }
    
    private var players: [Player]
    private var lapCounter: Int = 0
    private var ia: IA?
    
    init(withPlayers gamers: [Player]) {
        players = gamers
        currentPlayer = players[0]
        initGame()
    }
    
    private func initGame() {
        ia = IA(withGameViewModel: self)
        winner = nil
        matches.removeAll()
        for index in 0..<maxMatches {
            matches.append(index)
        }
    }
    
    func reset() {
        initGame()
    }
    
    func nextPlayer() {
        if lapCounter == 0 {
            showAlert(withMessage: "You must take at least 1 match")
        } else {
            affectPlayer()
        }
    }
    
    func startGame() {
        if currentPlayer.isIA {
            ia?.start()
        }
    }
    
    fileprivate func affectPlayer() {
        lapCounter = 0
        switch currentPlayer {
        case players[0] :
            currentPlayer = players[1]
        case players[1] :
            currentPlayer = players[0]
        default:
            break
        }
        
        if currentPlayer.isIA {
            ia?.start()
        }
        
    }
    
    func delete(value: Int) {
        if lapCounter == 3{
            showAlert(withMessage: "It's no longer your turn to play")
            nextPlayer()
        } else {
            guard let index = matches.firstIndex(of: value) else {return}
            matches.remove(at: index)
            lapCounter += 1
            checkIfGameOver()
        }
    }
    
    func deleteLastIndex() {
        if lapCounter == 3 {
            nextPlayer()
        } else {
            matches.removeLast()
            lapCounter += 1
            checkIfGameOver()
        }
    }
    
    private func checkIfGameOver() {
        if matches.count == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.ia = nil
                self.winner = self.currentPlayer
            }
        }
    }
    
    private func gatColumns() -> [GridItem] {
        var grids: [GridItem] = []
        var numberOfMatchInLine = maxMatches / 4
        if maxMatches % 4 != 0 {
            numberOfMatchInLine += 1
        }
        for _ in 0..<numberOfMatchInLine {
            grids.append(GridItem(.flexible()))
        }
        return grids
    }
    
    private func showAlert(withMessage message: String) {
        showAlert = true
        alertMessage = message
    }
    
}
