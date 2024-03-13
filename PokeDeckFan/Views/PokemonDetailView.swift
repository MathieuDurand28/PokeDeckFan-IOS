//
//  PokemonDetailView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 13/03/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemonType: PokemonType
    
    var body: some View {
        VStack {
            List {
                VStack {
                    HStack {
                        Spacer()
                        Text("Résistances pour le type ")
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("\(pokemonType.name.fr) - \(pokemonType.name.en) - \(pokemonType.name.jp)")
                        Spacer()
                    }
                }
                
                VStack {
                    ForEach(pokemonType.resistances, id: \.name) { res in
                        HStack {
                            Text("\(res.name)")
                            Spacer()
                            Text("\(String(format: "%.2f", res.multiplier))")
                        }
                        
                    }
                }
            }
            
        }
    }
}
