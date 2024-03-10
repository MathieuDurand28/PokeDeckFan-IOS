//
//  HomeView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct HomeView: View {
    @State var request: String = ""
    
    var body: some View {
        List {
            Section("Recherche") {
                TextField(text: $request) {
                    Text("Recherche avec un nom")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
