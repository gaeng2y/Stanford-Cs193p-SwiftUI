//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by gaeng on 2022/09/14.
//

// ViewModel
import SwiftUI

class EmojiMemoryGame {
    static let emojis: Array<String> = ["🏎", "🚌", "🚎", "🚐", "🚑", "🚒", "🚓", "🚕", "🚗", "🚙", "🚚", "🚛", "🚜", "🚲", "🛴", "🛵", "🛺", "🏍", "🚅", "🚟", "✈️", "🛩", "🛸", "🚂", "🚈"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    // private(set) 외부에서 읽기만 가능하고, 내부에서는 쓰기가 가능하도록 하는 간결한 코드 (getter, setter)
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
