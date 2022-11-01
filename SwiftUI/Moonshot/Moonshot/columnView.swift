//
//  columnView.swift
//  Moonshot
//
//  Created by Dan Engel on 8/1/22.
//

import SwiftUI

struct columnView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decodeData("astronauts.json")
    let missions: [Mission] = Bundle.main.decodeData("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                            
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct columnView_Previews: PreviewProvider {
    static var previews: some View {
        columnView()
    }
}
