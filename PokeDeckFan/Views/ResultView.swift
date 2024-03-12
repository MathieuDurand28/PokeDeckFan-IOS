//
//  ResultView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 12/03/2024.
//

import SwiftUI

struct ResultView: View {
    let datas: Tyradex
    @Binding var shiny: Bool
    
    var body: some View {
        Text("Hello, \(datas.name?.jp ?? "World")")
    }
}

#Preview {
    ResultView(datas: Tyradex(name: nil, status: 0, message: "", sprites: nil, types: nil, stats: nil, height: nil, weight: nil), shiny: .constant(false))
}
