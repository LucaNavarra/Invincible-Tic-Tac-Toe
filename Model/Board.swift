//
//  Board.swift
//  
//
//  Created by Luca Navarra on 06/04/23.
//

import Foundation



typealias Move = Int            //A move is an integer 0-8 indicating a place to put an element
struct values {
    var position : Int          //Element Position
    var number : Int            //Number to put in the position
    
    init(position: Int, number: Int) {
        self.position = position
        self.number = number
    }
}

class Board {
    var position: [Tile]                 //Game table
    var turn: Tile                       //Who has to play
    var lastMove : Move                  //Last move
    var legalMoves : [Move]              //Possible moves
    var best : [Int]                     //Best possible move
    var isFirst : Bool                   //true if the table is empty
    var evaluations : [values] = []      //Evaluations for each legal move
    
    
    
    init(){
        self.turn = .O
        self.position =  [.Empty,.Empty,.Empty,
                          .Empty,.Empty,.Empty,
                          .Empty,.Empty,.Empty]
        
        self.lastMove = -1
        self.legalMoves = [0,1,2,
                           3,4,5,
                           6,7,8]
        self.best = []
        self.best.append(-1)
        self.isFirst = true
        self.evaluations = []

    }
    
    
    
    /// Clears the board
    func emptyBoard() {

        self.turn = .O
        self.position =  [.Empty,.Empty,.Empty,
                          .Empty,.Empty,.Empty,
                          .Empty,.Empty,.Empty]

        self.lastMove = -1
        self.legalMoves = [0,1,2,
                           3,4,5,
                           6,7,8]
        self.best = []
        self.best.append(-1)
        self.isFirst = true
        self.evaluations = []

    }
    
    
    
    /// Finds all the possible moves
    /// - Returns: An array of all the possible moves
    func findLegalMoves() -> [Move]{
        return position.indices.filter{ position[$0] == .Empty }
    }
    
    
    
    /// Checks if the winning conditions are satisfied
    /// - Returns: Winner's tile
    func checkWinner() -> Tile{
        if(position[0] == position[1] && position[0] == position[2] && position[0] != .Empty){
            return position[0]
        } //Row 0
        else if(position[3] == position[4] && position[3] == position[5] && position[3] != .Empty){
            return position[3]
        } //Row 1
        else if(position[6] == position[7] && position[6] == position[8] && position[6] != .Empty){
            return position[6]
        } //Row 2
        
        
        else if(position[0] == position[3] && position[0] == position[6] && position[0] != .Empty){
            return position[0]
        } //Column 0
        else if(position[1] == position[4] && position[1] == position[7] && position[1] != .Empty){
            return position[1]
        } //Column 1
        else if(position[2] == position[5] && position[2] == position[8] && position[2] != .Empty){
            return position[2]
        } //Column 2
        
        
        else if(position[0] == position[4] && position[0] == position[8] && position[0] != .Empty){
            return position[0]
        } //Diagonal 0
        else if(position[2] == position[4] && position[2] == position[6] && position[2] != .Empty){
            return position[2]
        } //Diagonal 1
        
        else{
            return .Empty
        }
    }
    
    
    
    /// Checks if all the elements are placed and no one wins
    /// - Returns: true if there is a tie
    func checkDraw() -> Bool{
        return checkWinner() == .Empty && legalMoves.count == 0
    }
    
    
    
    /// Generates a random starting move
    /// - Returns: A random integer between [0,2,4,6,8]
    func randomStart() -> Move{
        if(self.legalMoves.count == 9){
            var randStart : [Move] = [0, 2, 4, 6, 8]
            randStart.shuffle()
            return randStart.first ?? 0
        }else {return 0}
    }
    
    
    
    /// Function used to place a tile
    /// - Parameter location: Where to place the tile
    func move (location : Move) {

        ///Sets the tile in the correct location
        var tmpPosition = self.position
        tmpPosition[location] = self.turn
        self.position = tmpPosition
        
        ///Switches turn
        self.turn = turn.opposite
        
        ///Saves the last move
        self.lastMove = location
        
        ///Updates legal moves
        self.legalMoves = findLegalMoves()
        
    }
    
    
    
    /// Function used to remove a tile
    /// - Parameter location: Where to remove the tile
    func removeTile(location : Move) {
        var tmpPosition = self.position
        tmpPosition[location] = .Empty
        self.position = tmpPosition
        self.legalMoves = findLegalMoves()
        self.turn = self.turn.opposite
    }
    
    
    
    /// Evaluates the full board
    /// - Returns: An integer that represents the winner (10 if the winner is O, -10 if the winner is X, 0 if there is a tie)
    func evaluateBoard() -> Int{
        var value : Int = 0
        if(self.checkWinner() != .Empty){
            if(self.checkWinner() == .O){
                value = 10 //O wins
            }else if (self.checkWinner() == .X){
                value = -10 //X wins
            }
        }else if(self.checkDraw()){
            value = 0 //Draw
        }
        return value
    }
    
    
    
    /// Function to use for update the best possible move that consider the current state of the bord
    /// - Parameter board: board with the placed tiles in the chosen positions
    /// - Returns: Best possible move for the turn player
    func bestMove(board : Board) -> Move {
      // AI to make its turn
        var tmpValue : values = values(position: 0, number: 0)
        
        if(board.legalMoves.count == 9){
            var randStart : [Move] = [0, 2, 4, 6, 8]
            randStart.shuffle()
            return randStart.first ?? 4
        }
        var bestScore = -1000
        var move : Move = -1
        for item in board.legalMoves{
            board.move(location: item)
            //self.evaluations.position.append(item)
            tmpValue.position = item
            let score = minimax(board: board, depth: 0, isMax: false)
            tmpValue.number = score
            //self.evaluations.number.append(score)
            self.evaluations.append(tmpValue)
            board.removeTile(location: item)
            if(score > bestScore) {
                move = item
                bestScore = score
            }
        }
        /*
        if(self.turn == .O){
            self.move(location: move)
        }
         */
        self.best.append(move)
        return move
    }
    
    
    
    /// Minimax algorithm - Simulates all the game assuming that the opponent is a perfect player
    /// - Parameters:
    ///   - board: Actual state of the game
    ///   - depth: Depth of the game's tree
    ///   - isMax: true if is the turn of Max
    /// - Returns: The score for a cell
    func minimax(board : Board, depth : Int, isMax : Bool) -> Int {
        let score = board.evaluateBoard()
        if (score == 10 || score == -10) {
            return score
        }
        if (score == 0 && board.legalMoves.isEmpty){
            return score
        }
        if(isMax){ //AI = .X (if isMax)
            var bestScore = -1000
            for item in board.legalMoves {  //for each possible move
                board.move(location: item)
                let score = minimax(board: board, depth: depth+1, isMax: false)
                board.removeTile(location: item) //In every board i have the simulated move
                bestScore = max(score, bestScore)

            }
            return bestScore
        }else if(!isMax) { //HUMAN = .O (if isMin)
            var bestScore = 1000
            for item in board.legalMoves {  //for avalible spots
                board.move(location: item)
                let score = minimax(board: board, depth: depth+1, isMax: true)
                board.removeTile(location: item) //In every board i have the simulated move
                bestScore = min(score, bestScore)
            }
            return bestScore
        }else {
            return score
        }
    }
    
    
    
}
