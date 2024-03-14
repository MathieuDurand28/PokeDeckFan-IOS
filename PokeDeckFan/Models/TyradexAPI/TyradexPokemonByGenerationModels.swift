//
//  TyradexPokemonByGenerationModels.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 14/03/2024.
//

import Foundation

struct PokemonByGeneration: Codable {
    let pokedex_id: Int
    let generation: Int
    let name: Name
    let sprites: Sprites
    
    struct Name: Codable {
        let fr: String
        let en: String
        let jp: String
    }
    
    struct Sprites: Codable {
        let regular: String
        let shiny: String 
    }
}
