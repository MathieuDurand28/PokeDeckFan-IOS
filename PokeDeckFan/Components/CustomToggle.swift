//
//  ToggleStyle.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct CustomToggle: View {
    @Binding var toggle: Bool
    @Binding var disabled: Bool
    var toggleColor: Color
    var toggleName: String
    
    var body: some View {
        withAnimation(.bouncy) {
            Toggle("\(toggleName) \(disabled ? "( indisponible ) " : "")", isOn: $toggle)
                .tint(toggleColor)
                .foregroundStyle(toggle ? toggleColor : .accentColor)
                .disabled(disabled)
        }
    }
}
