//
//  ContentView.swift
//  BerserkShot
//
//  Created by Joe Zoll on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    let characters: [Character] = Bundle.main.decode("characters.json")
    
    // UI
    let layout = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(characters, id: \.name) { character in
                            NavigationLink {
                                CharacterView(character: character)
                            } label: {
                                VStack {
                                    Image(character.image_url)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(
                                            width: 140,
                                            height: 140
                                        )
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 10)
                                        )
                                        .padding()
                                    VStack {
                                        Text(character.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                            .fontWeight(.thin)
                                            .kerning(5)
                                        Text(character.role)
                                            .foregroundColor(.white)
                                            .font(.caption)
                                            .fontWeight(.ultraLight)
                                            .kerning(2.5)
                                    }
                                    .padding(.vertical)
//                                    .frame(maxWidth: .infinity + 10)
//                                    .background(
//                                        .black
////                                        RadialGradient(stops: [
////                                            .init(color: .black, location: 0.25),
////                                            .init(color: .white, location: 0.75)
////                                        ], center: .center, startRadius: 60, endRadius: 70)
//
////                                        LinearGradient(colors: [.white, .black, .black, .white], startPoint: .leading, endPoint: .trailing)
//                                    )
                                }
                                .background(
                                    LinearGradient(colors: [.gray.opacity(0.5), .black, .gray.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
//                                    RadialGradient(stops: [
//                                        .init(color: .black, location: 0.25),
//                                        .init(color: .white, location: 0.75)
//                                    ], center: .center, startRadius: 10, endRadius: 9)
                                )
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 3)
                                )
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
                
                .background(
                    .black
                    
                )
                .navigationTitle("Berserkshot")
                .preferredColorScheme(.dark)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
