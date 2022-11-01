//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Dan Engel on 10/19/22.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    
    var body: some Scene {
        let game = MemoryGame()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
