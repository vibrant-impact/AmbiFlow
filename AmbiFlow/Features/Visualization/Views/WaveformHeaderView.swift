//
//  WaveformHeaderView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct WaveformHeaderView: View {
    let activeNoteName: String
    let activeNoteFrequency: Float
    let isPlaying: Bool
    
    var body: some View {
        HStack {
            HStack(spacing: 6) {
                Circle()
                    .fill(
                        isPlaying
                        ? Color.indigo
                        : Color.slate
                    )
                    .frame(width: 6, height: 6)
                    .symbolEffect(
                        .pulse,
                        isActive: isPlaying
                    )
                
                Text("Harmonic Soundstage")
                    .font(
                        .system(
                            .caption2,
                            design: .monospaced
                        )
                    )
                    .foregroundColor(.slate)
            }
            
            Spacer()
            
            if isPlaying && !activeNoteName.isEmpty {
                HStack(spacing: 4) {
                    Image(systemName: "music.note")
                        .font(.caption2)
                        .foregroundColor(.indigo)
                    
                    Text(activeNoteName)
                        .font(
                            .system(
                                .caption,
                                design: .monospaced
                            )
                        )
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(
                        String(
                            format: "%.1fHz",
                            activeNoteFrequency
                        )
                    )
                    .font(
                        .system(
                            .caption2,
                            design: .monospaced
                        )
                    )
                    .foregroundColor(.slate)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.white.opacity(0.05))
                .cornerRadius(20)
            } else {
                Text("endless drifting silence...")
                    .font(
                        .system(
                            .caption2,
                            design: .monospaced
                        )
                    )
                    .italic()
                    .foregroundColor(.slate)
            }
        }
        .padding(.horizontal, 4)
    }
}
