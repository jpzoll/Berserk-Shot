//
//  Character.swift
//  BerserkShot
//
//  Created by Joe Zoll on 10/3/23.
//

import Foundation
import SwiftUI

struct Character: Codable {
    let name: String
    let role: String
    let description: String
    let image_url: String
    
    init(name: String, role: String, description: String, image_url: String) {
        self.name = name
        self.role = role
        self.description = description
        if let image = try? Image(image_url) {
            self.image_url = image_url
        } else {
            self.image_url = "no-image"
        }
    }
}
