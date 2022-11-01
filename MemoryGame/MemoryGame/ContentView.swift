//
//  ContentView.swift
//  MemoryGame
//
//  Created by Dan Engel on 10/19/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoryGame
    @State private var showingStartupSheet: Bool = true
    
    @State private var dealt = Set<Int> ()
    
    @Namespace private var dealingNamespace
    
    private func deal(_ card: MemoryGameModel<String>.Card) {
        dealt.insert(card.id)
    }
    
    private func isNotDealt(_ card: MemoryGameModel<String>.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: MemoryGameModel<String>.Card) -> Animation {
        var delay = 0.0
        
        if let index = viewModel.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (CardContstants.totalDealDuration / Double(viewModel.cards.count))
        }
        return Animation.linear(duration: CardContstants.dealDuration).delay(delay)
        
    }
    
    var body: some View {
        VStack {
            gameBody
            deckBody
        }
        .sheet(isPresented: $showingStartupSheet) {
            WelcomeView(viewModel: MemoryGame())
        }
    }
    
    var gameBody: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
            if isNotDealt(card) || (card.isMatched && !card.isFaceUp) {
                Color.clear
            } else {
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .onTapGesture {
                        withAnimation {
                            viewModel.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(CardContstants.color)
    }
    
    var restart: some View {
        Button("Restart") {
            withAnimation {
                dealt = []
                viewModel.restart()
            }
        }
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(viewModel.cards.filter(isNotDealt)) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .scale, removal: .identity))
            }
        }
        .frame(width: CardContstants.undealtWidth, height: CardContstants.undealtHeight)
        .foregroundColor(CardContstants.color)
        .onTapGesture {
            for card in viewModel.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    private struct CardContstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 1.5
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * aspectRatio
    }
}

struct CardView: View {
    let card: MemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(2).opacity(0.5)
                Text(card.content)
                    .font(font(in: geometry.size))

            }
            .cardify(isFaceUp: card.isFaceUp)
        }
        .rotation3DEffect(Angle.degrees(card.isFaceUp ? 0 : 180), axis: (0, 1, 0))
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryGame()
        game.choose(game.cards.first!)
        return ContentView(viewModel: game)
//        ContentView(viewModel: game)
    }
}
