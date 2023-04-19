import SwiftUI
@available(iOS 16.0, *)
struct ContentView: View {
    
    let screenSize = UIScreen.main.bounds
    @EnvironmentObject var gameState : GameState
     //private var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
     //private var isPortrait : Bool { UIDevice.current.orientation.isPortrait }
    
    var body: some View {
        
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
        
            VStack{
                
                Spacer()
                Text("INVINCIBLE")
                    .font(.system(size: (screenSize.width * screenSize.height) / 16000, weight: .bold, design: .rounded))
                    .foregroundColor(Color.blue)
                
                Text("TIC  TAC  TOE")
                    .font(.system(size: (screenSize.width * screenSize.height) / 16000, weight: .bold, design: .rounded))
                    .foregroundColor(Color.red)
                
                
                Spacer()
                
                ZStack{
                    
                    GameTableView(adjSize: 1850)
                    
                }
                .alert(isPresented: $gameState.isEnded){
                    Alert(title: Text(gameState.alertMessage),
                          dismissButton: .default(Text("Restart")){
                        gameState.resetTable()
                        if(gameState.board.isFirst){
                            let move = gameState.board.randomStart()
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
                            gameState.board.isFirst = false
                        }//if
                    })
                }
                
                
                
                Spacer()
                
            }//VStack
        
            .onAppear{
                if(gameState.board.isFirst){
                    let move = gameState.board.randomStart()
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
                    gameState.board.isFirst = false
                }//if
            }//onAppear
            .padding()
            }//ZStack
        
        
    }
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameState())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
