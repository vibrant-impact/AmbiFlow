//
//  InstrumentSelectorCard.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct InstrumentSelectorCard: View {
    @Binding var parameters: SoundscapeParameters
    let accentColor: Color = .teal // Replace with your theme.accentColor if passed down
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
                
            Picker("Instrument", selection: $parameters.selectedInstrument) {
                ForEach(GenerativeInstrument.allCases, id: \.self) { instrumentOption in
                    Text(instrumentOption.displayName)
                        .tag(instrumentOption)
                }
            }
            .pickerStyle(.menu)
            .tint(accentColor)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.8))
            .cornerRadius(10)
        }
    }
}
