//
//  MemoryGameViewModel.swift
//  MemoryGame
//
//  Created by Dan Engel on 10/19/22.
//

import SwiftUI

class MemoryGame: ObservableObject {
    static let emojis = ["🦜", "🦟", "🙈", "🪳", "🦎", "🪱", "🦄", "🦕", "🪰", "🐙", "🐔", "🐖", "🐁", "🐈‍⬛", "🦚", "🐌", "🐝", "🐰", "🐺", "🦩"]
    static var numberOfPairs: Int = 6
    
    static func createMemoryGame() -> MemoryGameModel<String> {
        print("this is the number of pairs \(numberOfPairs)")
        return MemoryGameModel<String>(numberOfPairs: numberOfPairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGameModel<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGameModel<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    }
    
    func setDifficulty(_ level: Int) {
        print("this is the level, \(level)")
        MemoryGame.numberOfPairs = level
        model = MemoryGame.createMemoryGame() 
    }
    
    func getScore() -> Int {
        return model.score
    }
    
    func restart() {
        model = MemoryGame.createMemoryGame()
    }
}
