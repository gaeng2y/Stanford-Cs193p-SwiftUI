//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by gaeng on 2022/09/14.
//

// ViewModel
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis: Array<String> = ["π", "π", "π", "π", "π", "π", "π", "π", "π", "π", "π", "π", "π", "π²", "π΄", "π΅", "πΊ", "π", "π", "π", "βοΈ", "π©", "πΈ", "π", "π"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 5) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    // private(set) μΈλΆμμ μ½κΈ°λ§ κ°λ₯νκ³ , λ΄λΆμμλ μ°κΈ°κ° κ°λ₯νλλ‘ νλ κ°κ²°ν μ½λ (getter, setter)
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
