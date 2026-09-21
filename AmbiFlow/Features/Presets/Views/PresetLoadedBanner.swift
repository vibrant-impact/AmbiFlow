//
//  PresetLoadedBanner.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-21.
//

import SwiftUI

struct PresetLoadedBanner: View {
    let presetName: String
    
    var body: some View {
        Label(
            "Loaded \(presetName)",
            systemImage: "checkmark.circle.fill"
        )
        .font(.caption.bold())
        .foregroundColor(.white)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}
