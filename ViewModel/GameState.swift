//
//  GameState.swift
//
//
//  Created by Luca Navarra on 05/04/23.
//


import Foundation


class GameState : ObservableObject {

    @Published var player : Tile                //Player's tile
    @Published var ai : Tile                    //AI Opponent's tile
    @Published var isEnded : Bool               //true if the game is ended
    @Published var alertMessage : String        //Message to show when the game ends
    @Published var bestPossibleMove : String    //Best possible move for who is playing (0...8)
    @Published var board : Board                //Board for update the table
    @Published var table : [String]             //Cells to show on screen (each string represents a cell)
    @Published var evalTable : [String]         //Cell's evaluations (each string represents a cell)
    @Published var previousState : [String]     //Cells of the previous state (before the move)
    
    
    
    init() {
        self.player = .X
        self.ai = .O
        self.isEnded = false
        self.alertMessage = "It's a tie!"
        self.bestPossibleMove = "1,3,5,7,9"
        self.table = [" "," "," ",
                      " "," "," ",
                      " "," "," "]
        self.evalTable = [" "," "," ",
                          " "," "," ",
                          " "," "," "]
        self.previousState = [" "," "," ",
                          " "," "," ",
                          " "," "," "]
        self.board = Board()
    }
    
    
    
    /// Clears the table
    func resetTable(){
        self.board.emptyBoard()
        self.player = .X
        self.ai = .O
        self.isEnded = false
        self.alertMessage = "It's a tie!"
        self.bestPossibleMove = "1,3,5,7,9"
        self.table = [" "," "," ",
                      " "," "," ",
                      " "," "," "]
        self.evalTable = [" "," "," ",
                          " "," "," ",
                          " "," "," "]
        self.previousState = [" "," "," ",
                          " "," "," ",
                          " "," "," "]
        
    }
    
    
    
    /// Updates the table
    func updateTable(){
        self.previousState = self.table
        for item in self.board.position.indices {
            self.table[item] = self.board.position[item].tileString
        }
        /*
        if (self.board.turn == .O){
            SoundManager.instance.playSound(soundOption: .tac)
        }else if (self.board.turn == .X){
            SoundManager.instance.playSound(soundOption: .tic)
        }
         */
        self.setMessage()

        //self.updateEvaluationValues()
        if(!self.board.isFirst){
            self.bestPossibleMove = String((self.board.best.last ?? -1000000)+1)
        }
        
    }
    
    
    
    /// Updates the evaluations for each cell
    func updateEvaluationValues() {
        if(!self.board.isFirst){
            self.board.best.append(self.board.bestMove(board: self.board))
        }
        self.evalTable = self.table
        for index in self.board.evaluations.indices{
            self.evalTable[self.board.evaluations[index].position] = String(self.board.evaluations[index].number)
                }
        //DEBUG: print(evalTable)
            }
    
    
    
    /// Updates the best possible move
    /// - Parameter move: best move
    func updateBestPossibleMove(move: Move){
        self.bestPossibleMove = String(move)
    }
    
    
    
    /// Updates the message shown when the game ends
    func setMessage(){
        if(self.board.checkWinner() != .Empty || self.board.checkDraw()){
            self.isEnded = true
            if(!self.board.checkDraw()){
                self.alertMessage = self.board.checkWinner().tileString + " wins!"
            }
        }
        
    }
    
    
    
    /// Prints the table on console [DEBUG]
    func printBoard() {
        print("\n", self.table[0], " ", self.table[1], " ", self.table[2],"\n",
                    self.table[3], " ", self.table[4], " ", self.table[5],"\n",
                    self.table[6], " ", self.table[7], " ", self.table[8],"\n")
    }
    
}
