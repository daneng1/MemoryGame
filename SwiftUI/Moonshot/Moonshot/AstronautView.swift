//
//  AstornautView.swift
//  Moonshot
//
//  Created by Dan Engel on 7/29/22.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut

    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 5)
                
                Text(astronaut.name)
                    .font(.title.bold())
                    .padding(.bottom, 5)
                
                Text(astronaut.description)
                    .font(.body)
                    .padding(.bottom, 5)
                
                Link("Learn More", destination: URL(string: "https://www.google.com/search?q=\(astronaut.firstName)+\(astronaut.id)")!)

                
            }
        }
        .background(.darkBackground)
    }
}

struct AstornautView_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decodeData("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
