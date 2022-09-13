//
//  ContentView.swift
//  Memorize
//
//  Created by gaeng on 2022/08/29.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🏎", "🚌", "🚎", "🚐", "🚑", "🚒", "🚓", "🚕", "🚗", "🚙", "🚚", "🚛", "🚜", "🚲", "🛴", "🛵", "🛺", "🏍", "🚅", "🚟", "✈️", "🛩", "🛸", "🚂", "🚈"]
    
    @State var emojiCount: Int = 10
    
    var body: some View {
        VStack {
            ScrollView {
                // 너비에 맞게 넣기 위해서는 GridItem(.adaptive(~)를 쓴다
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        CardView(content: $0)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
            
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
