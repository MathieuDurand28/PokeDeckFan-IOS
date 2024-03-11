//
//  HomeView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var api = ApiCall()
    
    @State var request: String = ""
    @State var shiny: Bool = false
    @State var toggleDisabled: Bool = false
    @State var datas: Tyradex? = nil
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField(text: $request) {
                        Text("Entrez un nom")      
                    }
                    .multilineTextAlignment(.center)
                    
                }
                if api.toggleResult != nil {
                    Section("Critéres supplémentaires") {
                        CustomToggle(toggle: $shiny, disabled: $toggleDisabled, toggleColor: .yellow, toggleName: "Shiny")
                    }
                }

                if let tyradex = api.tyradex {
                    Section("Résultat") {
                        if tyradex.message != nil {
                            Text("\(tyradex.message ?? "")")
                        }
                        Text("\(tyradex.name?["fr"] ?? "")")
                    }
                    .multilineTextAlignment(.center)
                }

            }
            .cornerRadius(10)
            //.scrollContentBackground(.hidden)
            Button("Recherche") {
                self.api.getInformationsFromAPI(name: "\(request)", mode: 1)
            }
            .disabled(request.isEmpty)
            .buttonStyle(.borderedProminent)
           
        }
        .onAppear(perform: {
            self.api.shinyModeDisabled()
        })
        .padding()

    }
    
}
                  
#Preview {
    HomeView()
}
