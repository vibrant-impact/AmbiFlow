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
    
    var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(theme.accentColor)
                .frame(width: 4, height: 4)
            
            Text(isPlaying ? "Playing" : "Loaded")
                .font(
                    .system(
                        size: 8,
                        weight: .bold,
                        design: .monospaced
                    )
                )
                .foregroundColor(theme.accentColor)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 3)
        .background(theme.badgeBg)
        .cornerRadius(6)
    }
}
