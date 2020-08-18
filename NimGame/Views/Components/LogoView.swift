//
//  LogoView.swift
//  NimGame
//
//  Created by Samir Mestari on 16/08/2020.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Text("Purple NIM")
                    .font(.system(size: 65, weight: .bold, design: .default))
                    .foregroundColor(.purpleGiraffe)
                HStack(alignment: .center, spacing: -10){
                    Rectangle()
                        .frame(width: geometry.size.width - 60,  height: 15)
                        .foregroundColor(.orange)
                        .padding(0)
                    Rectangle()
                        .frame(width: 45, height: 25)
                        .foregroundColor(.purpleGiraffe)
                        .cornerRadius(15)
                        .padding(0)
                        .zIndex(1)
                }
                .frame(width: geometry.size.width - 10)
            }
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
    }
}
