//
//  MemoryGame.swift
//  Memorize
//
//  Created by Thiago Antonio Ramalho on 07/02/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var indexOfTheFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for parIndex in 0..<numberOfPairCards {
            let content = cardContentFactory(parIndex)
            let randomId = parIndex*2
            cards.append(Card(content: content, id: randomId))
            cards.append(Card(content: content, id: randomId + 1))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("Card choosen: \(card)")
        guard let chosenIndex = cards.firstIndex(matching: card) else { return }

        guard !cards[chosenIndex].isFaceUp  else { return }
        guard !cards[chosenIndex].isMatched else { return }
      
        if let potential = indexOfTheFaceUpCard {

            if cards[chosenIndex].content == cards[potential].content {
                cards[chosenIndex].isMatched = true
                cards[potential].isMatched = true
            }
            
            self.cards[chosenIndex].isFaceUp = true
            
        } else {
            indexOfTheFaceUpCard = chosenIndex
        }
    }

    struct Card: Identifiable {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content:CardContent
        var id: Int
    }
}
