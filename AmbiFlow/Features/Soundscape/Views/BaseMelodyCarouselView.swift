//
//  BaseMelodyCarouselView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct BaseMelodyCarouselView: View {
    @Binding var selectedMelodyOption: BaseMelodyLoopOption
    
    // Tracks favorites locally for the UI.
    // Later, this can be moved to your ViewModel to save to Firestore.
    @State private var favoriteBaseMelodies: Set<BaseMelodyLoopOption> = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(BaseMelodyLoopOption.allCases, id: \.self) { melodyOption in
                        MelodySelectionCard(
                            melodyOption: melodyOption,
                            isSelected: selectedMelodyOption == melodyOption,
                            isFavorite: favoriteBaseMelodies.contains(melodyOption),
                            onSelect: {
                                selectedMelodyOption = melodyOption
                            },
                            onFavoriteToggle: {
                                toggleFavoriteStatus(for: melodyOption)
                            }
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
    }
    
    private func toggleFavoriteStatus(for melodyOption: BaseMelodyLoopOption) {
        if favoriteBaseMelodies.contains(melodyOption) {
            favoriteBaseMelodies.remove(melodyOption)
        } else {
            favoriteBaseMelodies.insert(melodyOption)
        }
    }
}

