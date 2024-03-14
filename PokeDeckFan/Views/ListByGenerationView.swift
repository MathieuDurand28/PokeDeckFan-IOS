//
//  ListGenerationView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 14/03/2024.
//

import SwiftUI

struct ListByGenerationView: View {
    @ObservedObject var api: ApiCall
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(api.generationList, id: \.generation) { gen in
                    NavigationLink(destination: GenerationDetailView(api: api, generation: gen.generation)) {
                        HStack {
                            Text("Génération N° \(gen.generation) - (\(gen.from)-\(gen.to))")
                        }
                    }
                }
            }
            .navigationTitle("Liste des Pokémons")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: {
            api.getGenerationList()
        })
         
    }
}
