//
//  ContentView.swift
//  Memorize
//
//  Created by Thiago Antonio Ramalho on 02/02/21.
//


import Foundation
import SwiftUI
struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }.padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    // MARK: - Drawing Constants
    let edgeLinesWith: CGFloat = 3.0
    let cornerRadiusDefault:CGFloat = 10.0
    let fontScaleFactor:CGFloat = 0.75
    
    var body: some View {
        
        GeometryReader { geometry in
            body(geometry.size)
        }
    }
    
    private func rectangle() -> RoundedRectangle {
        RoundedRectangle(cornerRadius: cornerRadiusDefault)
    }
    
    private func body(_ size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                rectangle().fill(Color.white)
                rectangle().stroke(lineWidth: edgeLinesWith)
                Text(card.content)
            } else {
                rectangle().fill()
            }
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
