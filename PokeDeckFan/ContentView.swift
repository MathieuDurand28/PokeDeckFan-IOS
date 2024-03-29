//
//  ContentView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var api = ApiCall()
    @State private var isLoading: Bool = false
    @State private var isOnline: Bool = true
    @State var sheetInfos: Bool = false
    
    var body: some View {
        VStack {
            if isLoading {
               ProgressView("Chargement en cours...")
            } else {
                if isOnline {
                    VStack {
                        TabView {
                            HomeView(api: api)
                                .tabItem { Label("Recherche par nom", systemImage: "magnifyingglass") }
                                .tag(0)
                            ListTypeView(api: api)
                                .tabItem { Label("Listes des résistances", systemImage: "list.bullet.clipboard") }
                                .tag(1)
                            ListByGenerationView(api: api)
                                .tabItem { Label("Liste des Pokémons", systemImage: "lizard.fill") }
                                .tag(2)
                        }
                        .toolbar {
                            Button(role: .cancel) {
                                sheetInfos.toggle()
                            } label: {
                                Image(systemName: "info.circle")
                            }
                            
                        }
                        
                    }
                    .sheet(isPresented: $sheetInfos, content: {
                        VStack {
                            Text("API crédit:")
                                .padding()
                            Text("Tyradex API -> https://tyradex.tech/")
                                .padding()
                            Text("Pokebuild API -> https://pokebuildapi.fr/api/v1")
                                .padding()
                            Button("retour") {
                                sheetInfos.toggle()
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                        }
                    })
                } else {
                    VStack {
                        Spacer()
                        Image(systemName: "ant.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Un problème est survenu. Merci de réessayer dans quelques instants.")
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                        Text("api dont't respond in time")
                            .font(.caption)
                    }
                }
            }
        }.onAppear(perform: {
            isLoading = true
            
            api.apiIsOffline { result in
                switch result {
                    case .success(_):
                        isLoading = false
                    case .failure(_):
                        print("erreur lors de l'appel API")
                        isOnline = false
                        isLoading = false
                }
            }
        })
    }
   
}

#Preview {
    ContentView()
}
