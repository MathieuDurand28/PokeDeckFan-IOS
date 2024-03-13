//
//  ListTypeView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct ListTypeView: View {
    @ObservedObject var api = ApiCall()
    
    
    var body: some View {
        NavigationStack {
            List(api.pokemonTypes) { type in
               NavigationLink(destination: {
                   PokemonDetailView(pokemonType: type)
               }, label: {
                   HStack {
                       Spacer()
                       Text("\(type.name.fr) - \(type.name.en) - \(type.name.jp)")
                       Spacer()
                   }
               })
           }
        }
        .onAppear(perform: {
            api.getAllTypesOfPokemon()
        })
        
           
    }
}

#Preview {
    ListTypeView()
}
