//
//  MemoryGame.swift
//  Memorize
//
//  Created by Thiago Antonio Ramalho on 07/02/21.
//

import Foundation

struct MemoryGame<CardContent> {
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
    
    mutating func choose(card: Card) {
        print("Card choosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    private func index(of card: Card) -> Int {
        
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content:CardContent
        var id: Int
    }
}
