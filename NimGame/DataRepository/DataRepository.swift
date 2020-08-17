//
//  DataRepository.swift
//  NimGame
//
//  Created by Samir Mestari on 13/08/2020.
//

import Foundation
import SwiftUI

struct DataRepository  {
    
    static var players = [
        Player(name: "Player One", color: Color.blue),
        Player(name: "Player One", color: Color.blue)
    ]
    
    static var gameObject = GameViewModel(withPlayers: DataRepository.players)
    
    static let iaNames: [String] = ["R2D2", "C-3PO","Wall-E","J.A.R.V.I.S","Optimus Prime","Siri","Alexa","T-800","Astro","Robocop","Goldorak"]
    
}
