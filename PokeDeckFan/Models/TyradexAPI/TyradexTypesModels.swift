//
//  TyradexTypesModels.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 14/03/2024.
//

import Foundation

struct PokemonType: Identifiable, Codable {
    let id: Int
    let name: TypeName
    let sprites: String
    let resistances: [Resistance]

    struct TypeName: Codable {
        let fr: String
        let en: String
        let jp: String
    }

    struct Resistance: Codable {
        let name: String
        let multiplier: Double
    }
}
