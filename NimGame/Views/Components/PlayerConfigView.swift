//
//  PlayerConfigView.swift
//  NimGame
//
//  Created by Samir Mestari on 13/08/2020.
//

import SwiftUI

struct PlayerConfigView: View {

    @Binding var player:Player
    var userInteraction: Bool = true 
    
    
    var body: some View {
        HStack {
            TextField(player.name, text: $player.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(userInteraction ? nil:Color.gray)
                .padding()
                .disabled(!userInteraction)
            VStack {
                ColorPicker("Player color", selection: $player.color)
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

struct PlayerConfigView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerConfigView(player: .constant(DataRepository.players.first!), userInteraction: false)
            .previewLayout(.sizeThatFits)
    }
}
