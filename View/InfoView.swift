//
//  InfoView.swift
//  
//
//  Created by Luca Navarra on 18/04/23.
//

import SwiftUI
@available(iOS 16.0, *)

struct InfoView: View {
    var body: some View {
        
        let screenSize = UIScreen.main.bounds



        
        ZStack{
            @Environment(\.colorScheme) var colorScheme
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            NavigationView(){
                ZStack{
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    
                VStack{
                    ScrollView{
                    //Spacer()
                    Text("INVINCIBLE")
                        .font(.system(size: (screenSize.width * screenSize.height) / 12000, weight: .bold, design: .rounded))
                        .foregroundColor(Color.blue)
                    Text("TIC  TAC  TOE")
                        .font(.system(size: (screenSize.width * screenSize.height) / 12000, weight: .bold, design: .rounded))
                        .foregroundColor(Color.red)
                    
                    Spacer()
                    Text("HOW DOES IT WORK?")
                        .font(.system(size: (screenSize.width * screenSize.height) / 22000))//, weight: .bold, design: .rounded))
                        .foregroundColor(Color.red)
                    
               
                    
                        HStack(spacing: (screenSize.width*screenSize.height)/30000){
                            Spacer()
                            Text("This playground application shows how does the minimax algorithm work with an interactive tic tac toe game.\nThe minimax algorithm is a popular search algorithm used in artificial intelligence for making decisions. \nTic Tac Toe game, which is a two-player game that requires players to place their symbols on a 3x3 grid, is a perfect example of where minimax algorithm can be applied. In this context, this application allows the user to play against an AI invincible opponent that always starts first, and evaluates the game state with the minimax algorithm.\nIn this game, the AI opponent always makes the best possible move based on the current state of the game. The use of the minimax algorithm enables the AI opponent to evaluate which move will lead to the best outcome for them. The algorithm works by first assigning scores to every possible move on the board. It then chooses the score with the highest value for itself and the lowest value for the opponent.\nThe user can interact with the game by placing symbols in the available spaces, and the application will show the AI opponent's move based on its implementation of the minimax algorithm. The user will be able to follow along with the AI's decision-making process and understand how the algorithm works.\nOverall, the application will provide a fun way for users to play Tic Tac Toe while also showing them how the minimax algorithm works. It is an excellent tool for anyone who wants to learn more about artificial intelligence and game theory.\n\nHere is a quick example to show how does the algorithm determinate the values that represents where to place the tile.")
                                .font(.system(size: (screenSize.width * screenSize.height) / 30000))//, weight: .bold, design: .rounded))
                                .foregroundColor(Color("LineColor"))
                            Spacer()
          
                        }
                        Image(colorScheme == .dark ? "Group 1" : "Group 2")
                            .resizable()
                            .scaledToFit()
                        //Image("Group 1").resizable().scaledToFill()
                    }
                    Spacer()
                    Spacer()
                    NavigationLink(destination: MainView()) {
                        Text("CLICK HERE TO PLAY")
                            .font(.system(size: (screenSize.width * screenSize.height) / 25000, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    Spacer()
                    
                }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
        
        
    }
}

@available(iOS 16.0, *)
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
