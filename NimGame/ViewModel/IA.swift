//
//  JarvisViewModel.swift
//  NimGame
//
//  Created by Samir Mestari on 14/08/2020.
//

import Foundation
import SwiftUI

enum IALevel: Int {
    case stupid = 0
    case human = 1
    case einstein = 2
}

class IA {

    @AppStorage("IA_Level") var IA_Level: IALevel = .einstein
    
    private let game: GameViewModel
    private var iaLapCounter: Int = 0
    
    init(withGameViewModel game:GameViewModel) {
        self.game = game
    }
    
    func start() {
        iaLapCounter = getNumberOfLap()
        nextStep(continue: true)
    }
    
    private func play() {
        if iaLapCounter == 0 {
            nextStep(continue: false)
        } else {
            game.deleteLastIndex()
            iaLapCounter -= 1
            nextStep(continue: true)
        }
    }
    
    private func nextStep(continue c: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if c {
                self.play()
            } else {
                self.game.nextPlayer()
            }
        }
    }
    
    private func getNumberOfLap() -> Int {
        switch IA_Level {
        case .stupid:
            return stupidCompute()
        case .human:
            return humanCompute()
        case .einstein:
            return einsteinCompute()
        }
    }
    
    private func stupidCompute() -> Int {
        let value = Int.random(in: 1...3)
        return value
    }
    
    private func humanCompute() -> Int {
        let x = Int.random(in: 1...100)
        if x % 2 == 0 {
            return einsteinCompute()
        } else {
            return stupidCompute()
        }
    }
    
    private func einsteinCompute() -> Int{
        let x = game.matches.count
        if (x % 4) == 0  {
            return 3
        } else {
            let value = (x % 4 ) - 1
            if value == 0 {
                return 1
            }
            return  value
        }
    }
    
}
