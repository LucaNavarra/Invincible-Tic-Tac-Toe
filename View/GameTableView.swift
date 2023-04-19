//
//  GameTableView.swift
//  
//
//  Created by Luca Navarra on 08/04/23.
//

import SwiftUI
import AVFoundation
@available(iOS 16.0, *)

struct GameTableView: View {
    let screenSize = UIScreen.main.bounds
    var adjSize : CGFloat = 1700
    @EnvironmentObject var gameState : GameState

    
    
    var body: some View {
        ZStack{
            let frameSize = (screenSize.height*screenSize.width) / adjSize
            
            Rectangle()//Black backgroung
                .frame(width: frameSize, height: frameSize)
                .foregroundColor(Color("LineColor"))
            VStack{
                
                
//**************************************************************************************************
                
                HStack{ //Row 1
                    
                    
                    //0
                    Text(gameState.table[0])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[0].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                                onTap(move: 0)
                            }//onTap
                            )
        
                    //1
                    Text(gameState.table[1])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[1].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                                onTap(move: 1)
                            }//onTap
                            )
                    
                    //2
                    Text(gameState.table[2])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[2].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                                onTap(move: 2)
                            }//onTap
                            )
                }//HStack Row 1
                
                
                
 //**************************************************************************************************
                
                
                
                HStack{ //Row 2
                    
                    
                    //3
                    Text(gameState.table[3])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[3].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                                onTap(move: 3)
                            }
                            )
        
                    //4
                    Text(gameState.table[4])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[4].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                                onTap(move: 4)
                            }//onTap
                            )
                    
                    //5
                    Text(gameState.table[5])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[5].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                                onTap(move: 5)
                            }//onTap
                            )
                }//HStack Row 2
                
                
//**************************************************************************************************
                
                
                
                HStack{ //Row 3
                    
                    
                    //6
                    Text(gameState.table[6])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[6].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                           onTap(move: 6)
                            }//onTap
                            )
        
                    //7
                    Text(gameState.table[7])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[7].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                             onTap(move: 7)
                            }//onTap
                            )
                    
                    //8
                    Text(gameState.table[8])
                        .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(gameState.board.position[8].tileColor)
                        .frame(
                            maxWidth: frameSize/3,
                            maxHeight: frameSize/3)
                        .background(
                            Rectangle()
                            .frame(width: frameSize/3 , height: frameSize/3)
                            .foregroundColor(Color("BackgroundColor"))
                            .onTapGesture {
                                onTap(move: 8)
                            }//onTap
                            )
                }//HStack Row 3
//**************************************************************************************************
            }//VStack
        }
    }
    
    
    func onTap(move : Move){
        if(gameState.board.legalMoves.contains(move)){
            gameState.board.move(location: move)
            gameState.updateTable()
            gameState.updateEvaluationValues()
            
            if(gameState.board.turn == .O){
                gameState.updateTable()
                gameState.updateEvaluationValues()
                gameState.board.move(location: gameState.board.bestMove(board: gameState.board))
               
            }//if
                gameState.updateTable()
            
        }//if
    }
    
}



@available(iOS 16.0, *)
struct GameTableView_Previews: PreviewProvider {
    static var previews: some View {
        GameTableView(adjSize: 1500).environmentObject(GameState())
    }
}
