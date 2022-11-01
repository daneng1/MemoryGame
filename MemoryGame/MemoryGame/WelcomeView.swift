//
//  WelcomeView.swift
//  MemoryGame
//
//  Created by Dan Engel on 10/20/22.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: MemoryGame
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Emoji Memory Game")
                .font(.largeTitle)
                .padding(10)
            VStack {
                Text("Difficulty").font(.title)
                Button("Easy") {
                    viewModel.setDifficulty(8)
                    dismiss()
                }
                Button("Medium") {
                    viewModel.setDifficulty(12)
                    dismiss()
                }
                Button("Hard") {
                    viewModel.setDifficulty(20)
                    dismiss()
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryGame()
        WelcomeView(viewModel: game)
    }
}
