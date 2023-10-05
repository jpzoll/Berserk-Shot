//
//  CharacterView.swift
//  BerserkShot
//
//  Created by Joe Zoll on 10/3/23.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    var body: some View {
        ScrollView {
            VStack {
                Image(character.image_url)
                    .resizable()
                    .scaledToFill()
                    .background(
                        RadialGradient(colors: [.gray, .black], center: .center, startRadius: 80, endRadius: 290)
                    )

                
                Text(character.description)
                    .padding()
                    .fontWeight(Font.Weight.light)
            }
        }
        .background(
            .black
        )
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var characters: [Character] = Bundle.main.decode("characters.json")
    static var previews: some View {
        CharacterView(character: characters[0])
            .preferredColorScheme(.dark)
    }
}
