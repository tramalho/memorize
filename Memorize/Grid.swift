//
//  Grid.swift
//  Memorize
//
//  Created by Thiago Ramalho on 02/03/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item:Identifiable, ItemView:View {
    
    private var items:[Item]
    private var viewForItem: (Item) -> ItemView
    
    init(items:[Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let gridLayout = GridLayout(itemCount: items.count, in: geometry.size)
            
            ForEach(0..<items.count) { index in
                let item = items[index]
                 viewForItem(item)
                    .frame(width: gridLayout.itemSize.width, height: gridLayout.itemSize.height)
                    .position(gridLayout.location(ofItemAt: index))
            }
        }
    }
}
