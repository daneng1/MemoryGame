//
//  gridView.swift
//  Moonshot
//
//  Created by Dan Engel on 8/1/22.
//

import SwiftUI

struct gridView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decodeData("astronauts.json")
    let missions: [Mission] = Bundle.main.decodeData("missions.json")
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.title)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedDate)
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.5))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }
                    .background(.lightBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct gridView_Previews: PreviewProvider {
    static var previews: some View {
        gridView()
    }
}
