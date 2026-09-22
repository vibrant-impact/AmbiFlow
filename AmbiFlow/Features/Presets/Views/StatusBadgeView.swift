//
//  StatusBadgeView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct StatusBadgeView: View {
    let theme: AppTheme
    let isPlaying: Bool
    let accentColor: Color?
    
    private var displayAccentColor: Color {
        accentColor ?? theme.accentColor
    }
    
    var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(displayAccentColor)
                .frame(width: 4, height: 4)
            
            Text(isPlaying ? "Playing" : "Loaded")
                .font(
                    .system(
                        size: 8,
                        weight: .bold,
                        design: .monospaced
                    )
                )
                .foregroundColor(displayAccentColor)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 3)
        .background(
            displayAccentColor.opacity(0.16)
        )
        .cornerRadius(6)
    }
}
