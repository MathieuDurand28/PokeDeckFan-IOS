//
//  HomeView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct HomeView: View {
    @State var request: String = ""
    @State var shiny: Bool = false
    @State var toggleDisabled: Bool = ApiCall().shinyModeEnabled()
    @State var datas: [String] = []
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField(text: $request) {
                        Text("Entrez un nom")
                    }
                }
                Section("Critéres supplémentaires") {
                    CustomToggle(toggle: $shiny, disabled: $toggleDisabled, toggleColor: .yellow, toggleName: "Shiny")

                }
                
                if !datas.isEmpty {
                    Section("Résultat") {
                        
                    }
                }

            }
            //.scrollContentBackground(.hidden)
            Button("Recherche") {
                
            }
            .disabled(request.isEmpty && true)
            .buttonStyle(.borderedProminent)
           
        }
        .padding()

    }
}

#Preview {
    HomeView()
}
