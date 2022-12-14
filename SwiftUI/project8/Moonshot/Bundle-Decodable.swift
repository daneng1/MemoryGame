//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Paul Hudson on 09/11/2021.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        do {
            let loaded = try decoder.decode(T.self, from: data)
        } catch {
            print(error)
            fatalError()
        }

        return isLoaded as! T
    }
}
