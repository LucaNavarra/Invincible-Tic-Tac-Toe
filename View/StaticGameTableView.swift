//
//  StaticGameTableView.swift
//  
//
//  Created by Luca Navarra on 17/04/23.
//

import SwiftUI

struct StaticGameTableView: View {
        let screenSize = UIScreen.main.bounds
        var adjSize : CGFloat = 1800
        @EnvironmentObject var gameState : GameState
        
    var body: some View {
        
        HStack(spacing: ((screenSize.height*screenSize.width)/adjSize)) {
            
            let frameSize = (screenSize.height*screenSize.width) / adjSize
            ZStack{
               
                Rectangle()//Black backgroung
                    .frame(width: frameSize, height: frameSize)
                    .foregroundColor(Color("LineColor"))
                VStack{
                    
//**************************************************************************************************
                    
                    HStack{ //Row 1
                        
                        
                        //0
                        if(gameState.previousState[0] == "X" || gameState.previousState[0] == "O"){
                            Text(gameState.previousState[0])
                                .foregroundColor(gameState.board.position[0].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[0])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                        //1
                        if(gameState.previousState[1] == "X" || gameState.previousState[1] == "O"){
                            Text(gameState.previousState[1])
                                .foregroundColor(gameState.board.position[1].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[1])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                        //2
                        if(gameState.previousState[2] == "X" || gameState.previousState[2] == "O"){
                            Text(gameState.previousState[2])
                                .foregroundColor(gameState.board.position[2].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[2])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                    }//HStack Row 1
                    
                    
                    
//**************************************************************************************************
                    
                    
                    
                    HStack{ //Row 2
                        
                        
                        //3
                        if(gameState.previousState[3] == "X" || gameState.previousState[3] == "O"){
                            Text(gameState.previousState[3])
                                .foregroundColor(gameState.board.position[3].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[3])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                        
                        //4
                        if(gameState.previousState[4] == "X" || gameState.previousState[4] == "O"){
                            Text(gameState.previousState[4])
                                .foregroundColor(gameState.board.position[4].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[4])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                        
                        //5
                        if(gameState.previousState[5] == "X" || gameState.previousState[5] == "O"){
                            Text(gameState.previousState[5])
                                .foregroundColor(gameState.board.position[5].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[5])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                    }//HStack Row 2
                    
                    
//**************************************************************************************************
                    
                    
                    
                    HStack{ //Row 3
                        
                        
                        //6
                        if(gameState.previousState[6] == "X" || gameState.previousState[6] == "O"){
                            Text(gameState.previousState[6])
                                .foregroundColor(gameState.board.position[6].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[6])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                        
                        //7
                        if(gameState.previousState[7] == "X" || gameState.previousState[7] == "O"){
                            Text(gameState.previousState[7])
                                .foregroundColor(gameState.board.position[7].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[7])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                        
                        //8
                        if(gameState.previousState[8] == "X" || gameState.previousState[8] == "O"){
                            Text(gameState.previousState[8])
                                .foregroundColor(gameState.board.position[8].tileColor)
                                .font(.system(size: frameSize / 4.5, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }else{
                            Text(gameState.evalTable[8])
                                .font(.system(size: frameSize / 9, weight: .bold, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("LineColor"))
                                .frame(
                                    maxWidth: frameSize/3,
                                    maxHeight: frameSize/3)
                                .background(
                                    Rectangle()
                                        .frame(width: frameSize/3 , height: frameSize/3)
                                        .foregroundColor(Color("BackgroundColor"))
                                )
                        }
                    }//HStack Row 3
//**************************************************************************************************
                }//VStack
            }
            if(!gameState.board.isFirst){
                Text(String("Best move: " + gameState.bestPossibleMove))
                    .font(.system(size: frameSize/4.5, weight: .bold, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color("LineColor"))
            }
        }//HStack
        
    }
    }


struct StaticGameTableView_Previews: PreviewProvider {
    static var previews: some View {
        StaticGameTableView().environmentObject(GameState())
    }
}
