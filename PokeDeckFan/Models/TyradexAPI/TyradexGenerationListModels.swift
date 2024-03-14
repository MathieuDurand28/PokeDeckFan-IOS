//
//  TyradexGenerationListModels.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 14/03/2024.
//

import Foundation


struct GenerationList: Codable {
    let generation: Int
    let from: Int
    let to: Int
}
