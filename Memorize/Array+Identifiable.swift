//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Thiago Ramalho on 03/03/21.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element) -> Int? {
        
        for index in 0..<self.count {
            if self.self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
