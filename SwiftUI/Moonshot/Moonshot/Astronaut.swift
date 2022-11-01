//
//  Astoronaut.swift
//  Moonshot
//
//  Created by Dan Engel on 7/27/22.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    
    var firstName: String {
        String(name.split(separator: " ")[0])
        
    }
}
