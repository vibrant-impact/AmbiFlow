//
//  EmptyPresetView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct EmptyPresetsView: View {
    let iconName: String
    let message: String
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.slate.opacity(0.4))
            
            Text(message)
                .font(.caption)
                .foregroundColor(.slate)
            
            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}
