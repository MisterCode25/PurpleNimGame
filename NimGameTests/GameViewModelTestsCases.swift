//
//  GameViewModelTests.swift
//  NimGameTests
//
//  Created by Samir Mestari on 22/08/2020.
//

import XCTest
import SwiftUI
@testable import NimGame

class GameViewModelTestsCases: XCTestCase {
    
    var gameVM: GameViewModel!
    var players: [Player] = [
        Player(name: "First Player", color: Color.blue, isIA: false),
        Player(name: "IA Player", color: Color.orange, isIA: true)
    
    ]
    
    var players2: [Player] = [
        Player(name: "First Player", color: Color.blue, isIA: true),
        Player(name: "IA Player", color: Color.orange, isIA: true)
    
    ]
    
    var initialMatchesNumber: Int!
    
    
    override func setUp() {
        super.setUp()
        gameVM = GameViewModel(withPlayers: players)
        initialMatchesNumber = gameVM.matches.count
    }
    
    func testPlayerPlayThrice() {
        
        play(numberOfTime: 3)
        
        XCTAssertTrue(gameVM.matches.count == initialMatchesNumber - 3)
        
    }
    
    func testPlayerPlayFourTimes() {
        
        play(numberOfTime: 4)
        
        XCTAssertTrue(gameVM.matches.count == initialMatchesNumber - 3)
        XCTAssertTrue(gameVM.showAlert)
        
    }
    
    func testPlayerDoesNotPlay() {
        
        play(numberOfTime: 0)
        gameVM.nextPlayer()
        
        XCTAssertTrue(gameVM.matches.count == initialMatchesNumber)
        XCTAssert(gameVM.showAlert)
        
    }
    
    
    func testPlayerChange() {
        
        let currentPlayer = gameVM.currentPlayer
        play(numberOfTime: 1)
        gameVM.nextPlayer()
        
        XCTAssertTrue(currentPlayer != gameVM.currentPlayer)
        
    }
    
    func testAutoGameIfSecondPlayerIsIA() {
        
        gameVM.reset()
        play(numberOfTime: 1)
        let currentMatchesNumber = gameVM.matches.count
        
        gameVM.nextPlayer()
        
        XCTAssert(gameVM.currentPlayer.isIA)
        let exp = expectation(description: "Test after 0.5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
         if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(gameVM.matches.count < currentMatchesNumber)
         } else {
             XCTFail("Delay interrupted")
         }
        
    }
    
    func testIAVSIA() {
        
        gameVM = GameViewModel(withPlayers: players2)
        gameVM.startGame()
        
        let exp = expectation(description: "Test after 20 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 30)
         if result == XCTWaiter.Result.timedOut {
            XCTAssert(gameVM.matches.count == 1)
            XCTAssertTrue(gameVM.winner != nil)
         } else {
             XCTFail("Delay interrupted")
         }
    
    }
    
    
    
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
    private func play(numberOfTime time: Int) {
        if time == 0 {
            return
        }
        
        for _ in 1...time {
            if let element = gameVM.matches.randomElement(){
                gameVM.delete(value: element)
            }
        }
    }
    
}
