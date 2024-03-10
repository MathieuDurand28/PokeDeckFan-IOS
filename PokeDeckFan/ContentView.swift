//
//  ContentView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct ContentView: View {
     @State var sheetInfos: Bool = false
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem { Label("Recherche par nom", systemImage: "magnifyingglass") }
                    .tag(0)
                ListTypeView()
                    .tabItem { Label("Listes de types", systemImage: "list.bullet.clipboard") }
                    .tag(1)
                HomeView()
                    .tabItem { Label("", systemImage: "magnifyingglass") }
                    .tag(2)
            }
            .toolbar {
                Button("infos") {
                    sheetInfos.toggle()
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
       
    }
   
}

#Preview {
    ContentView()
}
