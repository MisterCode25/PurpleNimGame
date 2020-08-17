//
//  WinnerPageView.swift
//  NimGame
//
//  Created by Samir Mestari on 13/08/2020.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var game:GameViewModel
    @Binding var isPresented:Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 34, weight: .bold))
                })
                .foregroundColor(.purpleGiraffe)
            }.padding()
            Spacer()
            Text("The Winner is")
                .font(.system(size: 34, weight: .bold))
            Text("\(game.winner?.name ?? "Unknow")")
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(game.winner?.color ?? Color.blue)
            Image("youWin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            
            Button("Restart") {
                game.reset()
            }
            .padding()
            .frame(width: 150)
            .background(Color.purpleGiraffe)
            .foregroundColor(.white)
            .cornerRadius(15)
            
            Spacer()
        }
    }
}

struct WinnerPageView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(game:DataRepository.gameObject, isPresented: .constant(true))
    }
}
