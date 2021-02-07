//
//  MemoryGame.swift
//  Memorize
//
//  Created by Thiago Antonio Ramalho on 07/02/21.
//

import Foundation

class MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for parIndex in 0..<numberOfPairCards {
            let content = cardContentFactory(parIndex)
            let randomId = parIndex*2
            let isFaceUp = parIndex % 2 == 0
            cards.append(Card(isFaceUp: isFaceUp, content: content, id: randomId))
            cards.append(Card(isFaceUp: isFaceUp, content: content, id: randomId + 1))
        }
    }
    
    func choose(card: Card) {
        print("Card choosen: \(card)")
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content:CardContent
        var id: Int
    }
}
