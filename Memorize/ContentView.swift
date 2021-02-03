//
//  ContentView.swift
//  Memorize
//
//  Created by Thiago Antonio Ramalho on 02/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                CardView(faceUp: index % 2 == 0)
            }
        }.padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}

struct CardView: View {
    
    var faceUp: Bool
    
    var body: some View {
        ZStack {
            if faceUp {
                rectangle().fill(Color.white)
                rectangle().stroke(lineWidth: 3.0)
                Text("👻")
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
        ContentView()
    }
}
