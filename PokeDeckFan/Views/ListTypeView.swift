//
//  ListTypeView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct ListTypeView: View {
    @ObservedObject var api: ApiCall

    var body: some View {
        NavigationStack {
            List {
                ForEach(api.pokemonTypes, id: \.name.fr) { type in
                    NavigationLink(destination: PokemonDetailView(pokemonType: type)) {
                        HStack {
                            Spacer()
                            Text("\(type.name.fr) - \(type.name.en) - \(type.name.jp)")
                            Spacer()
                        }
                    }
                    
                }
            }
        }
        .onAppear(perform: {
            api.getAllTypesOfPokemon()
        })
    }
}
