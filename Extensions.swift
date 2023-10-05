//
//  Extensions.swift
//  BerserkShot
//
//  Created by Joe Zoll on 10/3/23.
//

import Foundation


extension Bundle {
    //  1. Load File
    //  2. Load data contents from file
    //  3. Decode data contents as astronaut objects (array)
    func decode<T: Codable>(_ file: String) -> T {
        guard let file = self.url(forResource: file, withExtension: nil) else {
            fatalError("Error loading file of name: \(file)")
        }
        
        guard let data = try? Data(contentsOf: file) else {
            fatalError("Error getting data from \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Error decoding data from \(file)")
        }
        
        return decoded
    }
}
