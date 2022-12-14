//
//  MemorizeApp.swift
//  Memorize
//
//  Created by gaeng on 2022/08/29.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
