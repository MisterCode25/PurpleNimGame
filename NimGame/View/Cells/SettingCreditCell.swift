//
//  SettingCreditCellView.swift
//  NimGame
//
//  Created by Samir Mestari on 16/08/2020.
//

import SwiftUI

struct SettingCreditCell: View {
    var body: some View {
        VStack(spacing:6){
            Text("Les défis")
                .font(.system(size: 30, weight: .bold))
            Text("de")
                .font(.system(size: 19, weight: .thin))
                .foregroundColor(.purpleGiraffe)
            Text("Purple Giraffe")
                .font(.system(size: 44, weight: .bold))
            Image("logoPurpleGiraffe")
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .aspectRatio(contentMode: .fit) 
            Link("https://www.purplegiraffe.fr", destination: URL(string: "https://www.purplegiraffe.fr")!)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

struct SettingCreditCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView(isPresented: .constant(true))
            SettingCreditCell()
                .previewLayout(.sizeThatFits)
        }
    }
}
