//
//  Player.swift
//  NimGame
//
//  Created by Samir Mestari on 12/08/2020.
//

import Foundation
import SwiftUI

struct Player: Equatable {
    var name: String
    var color: Color
    var isIA: Bool = false {
        didSet {
            randomName()
        }
    }
    
    private mutating func randomName() {
        if isIA {
            self.name = DataRepository.iaNames.randomElement() ?? "Unknow"
        } else {
            self.name = "Player \(Int.random(in: 1...10))"
        }
    }
    
}
