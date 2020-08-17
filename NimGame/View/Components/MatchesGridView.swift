//
//  AlumetteView.swift
//  NimGame
//
//  Created by Samir Mestari on 10/08/2020.
//

import SwiftUI

struct MatchesGridView: View {
    
    @ObservedObject var game:GameViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: game.columns, alignment: .center, spacing: 5) {
                ForEach(game.matches, id: \.self) { value in
                    MatchView(headColor: game.currentPlayer.color)
                        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            game.delete(value: value)
                        })
                        .transition(AnyTransition.scale(scale: 2).combined(with: .move(edge: .top)).combined(with: .slide).combined(with: .opacity))
                }
            }.animation(.default)
        }.disabled(game.currentPlayer.isIA)
    }
}

struct AlumetteView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesGridView(game: DataRepository.gameObject)
            .previewLayout(.sizeThatFits)
    }
}
