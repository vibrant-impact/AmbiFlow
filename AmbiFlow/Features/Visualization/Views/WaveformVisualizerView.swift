//
//  WaveformVisualizerView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct WaveformVisualizerView: View {
    let activeNoteName: String
    let activeNoteFrequency: Float
    let lfoRate: Float
    let isPlaying: Bool
    let audioLevel: Float
    let isGenerativeVoiceActive: Bool
    
    @State private var particleStore = ParticleStore()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            WaveformHeaderView(
                activeNoteName: activeNoteName,
                activeNoteFrequency: activeNoteFrequency,
                isPlaying: isPlaying
            )
            
            ZStack {
                WaveformCanvas(
                    particles: particleStore.particles,
                    lfoRate: lfoRate,
                    isGenerativeVoiceActive:
                        isGenerativeVoiceActive
                )
                
                ContinuousWaveformView(
                    isEnginePlaying: isPlaying,
                    audioLevel: audioLevel
                )
                .offset(y: -18)
                .allowsHitTesting(false)
            }
            
            frequencyGuide
        }
        .onChange(of: activeNoteFrequency) {
            _, newFrequency in
            
            guard isGenerativeVoiceActive else {
                return
            }
            
            guard newFrequency > 0 else {
                return
            }
            
            particleStore.addParticle(
                frequency: newFrequency,
                name: activeNoteName
            )
        }
        .onChange(of: isGenerativeVoiceActive) {
            _, isActive in
            
            if !isActive {
                particleStore.clear()
            }
        }
    }
    
    private var frequencyGuide: some View {
        HStack {
            Text("Low Registers (Base)")
            
            Spacer()
            
            Text("High Registers (Sparkle)")
        }
        .font(
            .system(
                size: 8,
                design: .monospaced
            )
        )
        .foregroundColor(
            Color.slate.opacity(0.6)
        )
        .padding(.horizontal, 2)
    }
}
