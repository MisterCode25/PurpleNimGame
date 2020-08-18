//
//  MatchNumberCellView.swift
//  NimGame
//
//  Created by Samir Mestari on 13/08/2020.
//

import SwiftUI

struct SettingMatchCell: View {
    
    @AppStorage("maxMatches") var matchesNumber: Int = 19
    
    // Un bug ne permet pas d'utiliser le Stepper correctement avec matchNumber. 
    @State var matchesNumberTemp: Int = 0
    
    var body: some View {
        HStack {
            Text("Matches")
            Spacer(minLength: 100)
            Stepper("\(matchesNumberTemp)") {
                if matchesNumberTemp < 50 {
                    matchesNumberTemp += 1
                }
            } onDecrement: {
                if matchesNumberTemp > 2 {
                    matchesNumberTemp -= 1
                }
            }.onChange(of: matchesNumberTemp, perform: { value in
                matchesNumber = value
            })
            .onAppear() {
                matchesNumberTemp = matchesNumber
            }
            
        }
    }
}

struct MatchNumberCellView_Previews: PreviewProvider {
    static var previews: some View {
        SettingMatchCell()
            .previewLayout(.sizeThatFits)
    }
}
