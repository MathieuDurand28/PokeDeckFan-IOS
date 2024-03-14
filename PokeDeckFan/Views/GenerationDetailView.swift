//
//  GenerationDetailView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 14/03/2024.
//

import SwiftUI

struct GenerationDetailView: View {
    @ObservedObject var api: ApiCall
    @State private var isLoading: Bool = false

    let generation: Int
    
    var body: some View {
        if isLoading {
           ProgressView("Chargement des Pokémons en cours...")
        } else {
            NavigationStack {
                List {
                    if !api.PokemonListByGeneration.isEmpty {
                        ForEach(api.PokemonListByGeneration, id: \.pokedex_id) { pok in
                            NavigationLink(destination: PokemonGenerationDetailView()) {
                                VStack {
                                    HStack {
                                        Text("N° \(pok.pokedex_id) - \(pok.name.fr) - \(pok.name.en) - \(pok.name.jp)")
                                        AsyncImage(url: URL(string: "\(pok.sprites.regular)"),
                                                   scale: 6)
                                    }
                                }
                            }
                        }
                    } else {
                        VStack {
                            Image(systemName: "lizard")
                                .resizable()
                                .frame(width: 50, height: 50)
                            HStack {
                                Spacer()
                                Text("Désolé, un problème est survenu lors de la récupération des Pokémons")
                                    .multilineTextAlignment(.center)
                                    .padding()
                                Spacer()
                            }
                            Spacer()
                            Text(".._..")
                                .font(.caption)
                        }
                        
                    }
                }
            }.onAppear(perform: {
                api.getPokemonByGeneration(gen: generation)
                /*
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isLoading = false
                }*/
                
            })
        }
    }
}
