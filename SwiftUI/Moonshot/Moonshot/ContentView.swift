//
//  ContentView.swift
//  Moonshot
//
//  Created by Dan Engel on 7/27/22.
//

import SwiftUI


struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decodeData("astronauts.json")
    let missions: [Mission] = Bundle.main.decodeData("missions.json")
    @State private var isGridView: Bool = true

    
    var body: some View {
        NavigationView {
            ScrollView {
                if isGridView {
                    gridView()
                } else {
                    columnView()
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem {
                    Toggle(isOn: $isGridView) {
                        Text(isGridView ? "Grid" : "List")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
