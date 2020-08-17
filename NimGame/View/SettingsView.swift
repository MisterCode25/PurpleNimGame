//
//  SettingsView.swift
//  NimGame
//
//  Created by Samir Mestari on 13/08/2020.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isPresented: Bool 
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General")) {
                    SettingMatchCell()
                }
                Section(header: Text("IA")) {
                    SettingsIALevelCellView()
                }
                Section(header: Text("Credit")) {
                    SettingCreditCell()
                }
            }
            .navigationBarItems(trailing:
                                    Button("OK", action: {
                                        isPresented = false
                                    })
            )
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(false))
    }
}
