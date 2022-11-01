//
//  Cardify.swift
//  MemoryGame
//
//  Created by Dan Engel on 10/28/22.
//

import SwiftUI

struct Caridfy: AnimatableModifier {
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0: 180
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if rotation < 90 {
                shape.fill().foregroundColor(Color(white: 0.9))
            } else {
                shape.fill().foregroundColor(.red)
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Caridfy(isFaceUp: isFaceUp))
    }
}
