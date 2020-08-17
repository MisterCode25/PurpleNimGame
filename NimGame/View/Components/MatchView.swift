//
//  MatchView.swift
//  NimGame
//
//  Created by Samir Mestari on 11/08/2020.
//

import SwiftUI

struct MatchView: View {
    
    let headColor: Color

    var body: some View {
        VStack(spacing:-5) {
            Rectangle()
                .frame(width: 15, height: 25)
                .foregroundColor(headColor)
                .cornerRadius(15)
                .padding(0)
                .zIndex(1)
            Rectangle()
                .frame(width: 10, height: 95)
                .foregroundColor(.orange)
                .padding(0)
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView(game: DataRepository.gameObject, isPresented: .constant(true))
            MatchView(headColor: Color.red)
                .previewLayout(.sizeThatFits)
        }
    }
}
