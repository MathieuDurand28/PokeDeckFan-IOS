//
//  ContentView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct ContentView: View {
     //@State private var test: Bool = false
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem { Label("Recherche par nom", systemImage: "magnifyingglass") }
                    .tag(0)
                HomeView()
                    .tabItem { Label("Recherche par type", systemImage: "flame") }
                    .tag(1)
            }
        }
    }
   
}

#Preview {
    ContentView()
}
