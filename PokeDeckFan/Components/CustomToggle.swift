//
//  ToggleStyle.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import SwiftUI

struct CustomToggle: View {
    @Binding var toggle: Bool
    var toggleColor: Color
    
    var body: some View {
        withAnimation(.bouncy) {
            Toggle("Tu aimes le rose ?", isOn: $toggle)
                .tint(toggleColor)
                .foregroundStyle(toggleColor)
        }
    }
}
