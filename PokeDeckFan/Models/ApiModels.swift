//
//  ApiModels.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 11/03/2024.
//

import Foundation

struct Tyradex: Decodable {
    let name: [String: String]?
    let status: Int?
    let message: String?
    //let sprites: Sprite
}

struct Sprite: Decodable {
    let regular: [String: String]
    let shiny: [String: String]
    let gmax: Gmax
}

struct Gmax: Decodable {
    let regular: [String: String]
    let shiny: [String: String]
}
