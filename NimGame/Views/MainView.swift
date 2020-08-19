//
//  WelcomeView.swift
//  NimGame
//
//  Created by Samir Mestari on 13/08/2020.
//

import SwiftUI

struct MainView: View {
    
    @State var firstPlayer = Player(name: "Player 1", color: Color.blue)
    @State var secondPlayer = Player(name: "Player 2", color: Color.green)
    @State private var isGameViewPresented = false
    @State private var isSettingsViewPresented = false
    @State private var modSelection: Int = 0
    @State private var userInteractionForP1: Bool = true
    @State private var userInteractionForP2: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isSettingsViewPresented = true
                }, label: {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.purpleGiraffe)
                        .padding()
                })
                .sheet(isPresented: $isSettingsViewPresented, content: {
                    SettingsView(isPresented: $isSettingsViewPresented)
                })
                Spacer()
            }
        
            LogoView()
                .frame(height: 150)
            
            Picker("CHoose your game mod", selection: $modSelection) {
                Text("P1 vs P2").tag(0)
                Text("P1 vs IA").tag(1)
                Text("IA vs IA").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: modSelection, perform: { value in
                switch value {
                case 0:
                    userInteractionForP1 = true
                    userInteractionForP2 = true
                    
                    firstPlayer.isIA = false
                    secondPlayer.isIA = false
                case 1:
                    userInteractionForP1 = true
                    userInteractionForP2 = false
                    
                    firstPlayer.isIA = false
                    secondPlayer.isIA = true
                case 2:
                    userInteractionForP1 = false
                    userInteractionForP2 = false
                    
                    firstPlayer.isIA = true
                    secondPlayer.isIA = true
                default:
                    break
                }
            })
            
            PlayerConfigView(player: $firstPlayer,userInteraction: userInteractionForP1)
            
            PlayerConfigView(player: $secondPlayer, userInteraction: userInteractionForP2)
            
            Spacer(minLength: 50)
            
            HStack(spacing: 20) {
                Button("START GAME") {
                    isGameViewPresented.toggle()
                }
                .frame(width: 150)
                .padding(10)
                .background(Color.purpleGiraffe)
                .foregroundColor(.white)
                .cornerRadius(10)
                .fullScreenCover(isPresented: $isGameViewPresented, content: {
                    GameView(game: GameViewModel(withPlayers: [firstPlayer, secondPlayer]), isPresented: $isGameViewPresented)
                })
                
            }
            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
