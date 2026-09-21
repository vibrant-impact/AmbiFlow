//
//  MelodySelectionCard.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct MelodySelectionCard: View {
    let melodyOption: BaseMelodyLoopOption
    let isSelected: Bool
    let isFavorite: Bool
    let onSelect: () -> Void
    let onFavoriteToggle: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: onFavoriteToggle) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        // NEW: Dynamic color logic for better contrast
                        .foregroundColor(
                            isFavorite ? .pink : (isSelected ? .white.opacity(0.8) : .gray.opacity(0.5))
                        )
                        .padding(8)
                }
            }
            
            Spacer()
            
            Text(melodyOption.rawValue)
                .font(.caption)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? .white : .primary)
                .padding(.bottom, 12)
                .padding(.horizontal, 4)
        }
        .frame(width: 120, height: 120)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isSelected ? Color.indigo : Color.white.opacity(0.05))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? Color.indigo.opacity(0.5) : Color.gray.opacity(0.2), lineWidth: 1)
        )
        // Animates the selection state smoothly
        .animation(.easeInOut(duration: 0.2), value: isSelected)
        .onTapGesture {
            onSelect()
        }
    }
}
