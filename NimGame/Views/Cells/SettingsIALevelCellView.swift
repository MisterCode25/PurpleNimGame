//
//  SettingsIALevelCellView.swift
//  NimGame
//
//  Created by Samir Mestari on 16/08/2020.
//

import SwiftUI

struct SettingsIALevelCellView: View {
    
    @AppStorage("IA_Level") var IA_Level: IALevel = .stupid
    @State var levelChoice: Int = 0
    
    var body: some View {
        HStack {
            Text("Level")
            Spacer()
            Picker("", selection: $levelChoice) {
                Text("Stupid").tag(0)
                Text("Human").tag(1)
                Text("Einstein").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: levelChoice, perform: { value in
                guard let level = IALevel(rawValue: value) else {return}
                IA_Level = level
            })
        }
        .onAppear() {
            levelChoice = IA_Level.rawValue
        }
    }
}

struct SettingsIALevelCellView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIALevelCellView()
            .previewLayout(.sizeThatFits)
    }
}
