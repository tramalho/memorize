//
//  ContentView.swift
//  Memorize
//
//  Created by Thiago Antonio Ramalho on 02/02/21.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }.padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                rectangle().fill(Color.white)
                rectangle().stroke(lineWidth: 3.0)
                Text(card.content)
            } else {
                rectangle().fill()
            }
        }
    }
    
    private func rectangle(cornerRadius: CGFloat = 10.0) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: cornerRadius)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
