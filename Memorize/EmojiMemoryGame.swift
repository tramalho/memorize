//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Thiago Antonio Ramalho on 07/02/21.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
     @Published private var model: MemoryGame<String>
    
    init() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷","☠️"]
        return MemoryGame(numberOfPairCards: emojis.count) { index in
            return emojis[index]
        }
    }
        
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
