//
//  MainView.swift
//  
//
//  Created by Luca Navarra on 15/04/23.
//

import SwiftUI
@available(iOS 16.0, *)
struct MainView: View {
    @EnvironmentObject var gameState: GameState
    var body: some View {
 
        TabView {
            ContentView()
                .tabItem {
                    Label("Game", systemImage: "gamecontroller")
                }

            TreeView()
                .tabItem {
                    Label("State", systemImage: "number")
                }
        }
    }
}
@available(iOS 16.0, *)
struct MainView_Previews: PreviewProvider {
    static var previews: some View {

        MainView()
            .environmentObject(GameState())
    }
}
