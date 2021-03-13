//
//  Array+Only.swift
//  Memorize
//
//  Created by Thiago Ramalho on 12/03/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
