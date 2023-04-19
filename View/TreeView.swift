//
//  TreeView.swift
//  
//
//  Created by Luca Navarra on 15/04/23.
//

import SwiftUI
@available(iOS 16.0, *)
struct TreeView: View {
    @EnvironmentObject var gameState : GameState
    var screenSize = UIScreen.main.bounds
    @State var trigger : Bool = false

    var body: some View {
 
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            
                Spacer()
                VStack{
                    Spacer()
                    GameTableView(adjSize: 3000)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()


                }
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    if(gameState.board.turn == .X){
                        StaticGameTableView(adjSize: 4500)
                    }else{
                        Text("X TURN")
                            .font(.system(size: (screenSize.width * screenSize.height) / 22000, weight: .bold, design: .rounded))
                            .foregroundColor(Color.red)
                    }
                    Spacer()
                }
                Spacer()
        }
            
    
    }
}
@available(iOS 16.0, *)
struct TreeView_Previews: PreviewProvider {
    static var previews: some View {

        TreeView().environmentObject(GameState())
    }
}
