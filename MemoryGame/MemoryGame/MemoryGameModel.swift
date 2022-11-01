//
//  CardModel.swift
//  MemoryGame
//
//  Created by Dan Engel on 10/19/22.
//

import Foundation


struct MemoryGameModel<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var numberOfFlips: Int = 0
//    var difficulty: Int = 8
    var score: Int = 100
    
    private var firstCardChosen: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatch = firstCardChosen {
                if cards[chosenIndex].content == cards[potentialMatch].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                }
                firstCardChosen = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                firstCardChosen = chosenIndex
                numberOfFlips += 1
                score -= 2
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
//    mutating func setDifficulty(_ level: Int) {
//        difficulty = level
//    }
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairs {
            print("this is the difficulty, \(pairIndex)")
            let content = createCardContent(pairIndex)
            cards.append(Card(id: 0, content: content))
            cards.append(Card(id: 0, content: content))
            
            cards.shuffle()
            cards.shuffle()
            
            for index in cards.indices {
                cards[index].id = index
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    struct Game {
        var difficulty: Difficulty
        var score: Int = 0
        var numberOfFlips: Int = 0
    }
    
    enum Difficulty {
        case easy
        case medium
        case hard
    }
    
}
