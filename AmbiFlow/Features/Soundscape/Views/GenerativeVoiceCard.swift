//
//  GenerativeVoiceCard.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct GenerativeVoiceCard: View {
    @Binding var parameters: SoundscapeParameters
    
    private let minimumDelay: Float = 0.15
    private let maximumDelay: Float = 3.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            header
            
            Divider()
                .overlay(Color.white.opacity(0.08))
            
            scaleSelection
            
            instrumentSelection
            
            Divider()
                .overlay(Color.white.opacity(0.08))
            
            notePaceSlider
            
            instrumentVolumeSlider
        }
        .padding()
        .background(Color.white.opacity(0.03))
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    Color.white.opacity(0.05),
                    lineWidth: 1
                )
        }
    }
    
    // MARK: - Header
    
    private var header: some View {
        HStack(spacing: 12) {
            Image(systemName: "waveform.path.ecg")
                .font(.title3)
                .foregroundColor(.purple)
                .frame(width: 28)
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Generative Voice")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("Markov melody and instrument")
                    .font(.caption)
                    .foregroundColor(.slate)
            }
            
            Spacer()
            
            Toggle(
                "",
                isOn: $parameters.isInstrumentActive
            )
            .labelsHidden()
            .tint(.purple)
        }
    }
    
    // MARK: - Scale
    
    private var scaleSelection: some View {

        VStack(alignment: .leading, spacing: 8) {
            Label(
                "Musical Scale",
                systemImage: "music.note.list"
            )
            .font(.caption)
            .foregroundColor(.slate)
            
            Picker(
                "Musical Scale",
                selection: $parameters.scale
            ) {
                Text("C Major Pentatonic")
                    .tag(MusicalScale.cMajorPentatonic)
                
                Text("A Minor Pentatonic")
                    .tag(MusicalScale.aMinorPentatonic)
                
                Text("E Lydian")
                    .tag(MusicalScale.eLydian)
                
                Text("D Dorian")
                    .tag(MusicalScale.dDorian)
                
                Text("Hirajoshi")
                    .tag(MusicalScale.hirajoshi)
            }
            .pickerStyle(.menu)
            .tint(.teal)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.8))
            .cornerRadius(10)
        }
        .disabled(!parameters.isInstrumentActive)
        .opacity(parameters.isInstrumentActive ? 1.0 : 0.45)
    }
    
    // MARK: - Instrument
    
    private var instrumentSelection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(
                "Instrument",
                systemImage: "guitars.fill"
            )
            .font(.caption)
            .foregroundColor(.slate)
            
            InstrumentSelectorCard(
                parameters: $parameters
            )
        }
        .disabled(!parameters.isInstrumentActive)
        .opacity(parameters.isInstrumentActive ? 1.0 : 0.45)
    }
    
    // MARK: - Note Pace
    
    private var notePaceSlider: some View {
        MixerSliderRow(
            label: "Note Pace",
            icon: "timer",
            value: notePaceBinding,
            sliderRange: minimumDelay...maximumDelay,
            displayDivisor: maximumDelay,
            accentColor: .purple
        )
        .disabled(!parameters.isInstrumentActive)
        .opacity(parameters.isInstrumentActive ? 1.0 : 0.45)
    }
    
    // MARK: - Instrument Volume
    
    private var instrumentVolumeSlider: some View {
        MixerSliderRow(
            label: "Instrument Volume",
            icon: "speaker.wave.3.fill",
            value: $parameters.instrumentVolume,
            sliderRange: 0.0...1.0,
            displayDivisor: 1.0,
            accentColor: .teal
        )
        .disabled(!parameters.isInstrumentActive)
        .opacity(parameters.isInstrumentActive ? 1.0 : 0.45)
    }
    
    // MARK: - Pace Conversion
    
    private var notePaceBinding: Binding<Float> {
        Binding(
            get: {
                delayToPace(parameters.melodyIntervalDelay)
            },
            set: { newPace in
                parameters.melodyIntervalDelay =
                    paceToDelay(newPace)
            }
        )
    }
    
    private func delayToPace(_ delay: Float) -> Float {
        let clampedDelay = min(
            maximumDelay,
            max(minimumDelay, delay)
        )
        
        return minimumDelay + maximumDelay - clampedDelay
    }
    
    private func paceToDelay(_ pace: Float) -> Float {
        let clampedPace = min(
            maximumDelay,
            max(minimumDelay, pace)
        )
        
        return minimumDelay + maximumDelay - clampedPace
    }
}
