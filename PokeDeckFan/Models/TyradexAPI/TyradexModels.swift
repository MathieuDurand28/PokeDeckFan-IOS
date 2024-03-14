//
//  TyradexModels.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 14/03/2024.
//

import Foundation

struct Tyradex: Decodable {
    let name: Name?
    let status: Int?
    let message: String?
    let sprites: Sprite?
    let types: [Types]?
    var list_types: [[String: String]]?
    let stats: [String: Int]?
    let height: String?
    let weight: String?
    
    struct Types: Decodable {
        let name: String
        let image: String
    }

    struct Name: Decodable {
        let fr: String
        let en: String
        let jp: String
    }

    struct Sprite: Decodable {
        let regular: String
        let shiny: String
        let gmax: Gmax?
    }

    struct Gmax: Decodable {
        let regular: String
        let shiny: String
    }
    
}
