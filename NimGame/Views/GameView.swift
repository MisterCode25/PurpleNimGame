//
//  ContentView.swift
//  NimGame
//
//  Created by Samir Mestari on 10/08/2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var game:GameViewModel
    @Binding var isPresented:Bool
    
    var body: some View {
        if game.winner != nil {
            ResultView(game:game,isPresented: $isPresented)
        } else {
            VStack(spacing: 3) {
                HStack {
                    Button(action: {
                        game.reset() 
                    }, label: {
                        Image(systemName: "gobackward")
                            .font(.system(size: 30, weight: .bold))
                    })
                    .foregroundColor(.purpleGiraffe)
                    
                    Spacer()
                    
                    VStack {
                        Text("Current player")
                            .foregroundColor(.purpleGiraffe)
                            .bold()
                        Text(game.currentPlayer.name)
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(game.currentPlayer.color)
                    }
                    
                    Spacer()
                   
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 34, weight: .bold))
                    })
                    .foregroundColor(.purpleGiraffe)
                }
                .padding(.trailing, 16)
                .padding(.leading,16)
               
                MatchesGridView(game: game)
                    .padding()
                
                if !game.currentPlayer.isIA {
                    Button("I'm done") {
                        game.nextPlayer()
                    }
                    .frame(width:100, height: 44)
                    .background(Color.purpleGiraffe)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .animation(.easeIn)
                    .transition(.opacity)
                }
                
                Spacer(minLength: 6)
                
            }
            .onAppear() {
                if game.currentPlayer.isIA {
                    game.startGame()
                }
            }
            .alert(isPresented: $game.showAlert, content: {
                Alert(title: Text(game.alertMessage))
            })
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    
    let gamers = [
        Player(name: "Player One", color: Color.blue),
        Player(name: "Player Two", color: Color.green)
    ]
    
    static var previews: some View {
        GameView(game: DataRepository.gameObject, isPresented: .constant(true))
            .previewDevice("iPhone SE (2nd generation)")
    }
}
