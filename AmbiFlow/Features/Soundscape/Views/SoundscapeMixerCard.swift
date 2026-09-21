//
//  SoundscapeMixerCard.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct SoundscapeMixerCard: View {
    @ObservedObject var ambientViewModel: AmbientViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Atmosphere Mixer")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.bottom, 4)
            
            VStack(spacing: 16) {
                // Ocean Waves
                MixerSliderRow(
                    label: "Ocean Waves",
                    icon: "water.waves",
                    value: $ambientViewModel.parameters.oceanVolume,
                    accentColor: .blue
                )
                .onChange(of: ambientViewModel.parameters.oceanVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Rainfall
                MixerSliderRow(
                    label: "Rainfall",
                    icon: "cloud.rain",
                    value: $ambientViewModel.parameters.rainVolume,
                    accentColor: .teal
                )
                .onChange(of: ambientViewModel.parameters.rainVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Fire
                MixerSliderRow(
                    label: "Fire",
                    icon: "flame",
                    value: $ambientViewModel.parameters.fireVolume,
                    accentColor: .red
                )
                .onChange(of: ambientViewModel.parameters.fireVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Deep Drone
                MixerSliderRow(
                    label: "Deep Drone",
                    icon: "lightspectrum.horizontal",
                    value: $ambientViewModel.parameters.deepDroneVolume,
                    accentColor: .orange
                )
                .onChange(of: ambientViewModel.parameters.deepDroneVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Airy Drone
                MixerSliderRow(
                    label: "Airy Drone",
                    icon: "aqi.low",
                    value: $ambientViewModel.parameters.airyDroneVolume,
                    accentColor: .yellow
                )
                .onChange(of: ambientViewModel.parameters.airyDroneVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Didgeridoo
                MixerSliderRow(
                    label: "Didgeridoo",
                    icon: "circle.grid.cross",
                    value: $ambientViewModel.parameters.didgeridooVolume,
                    accentColor: .blue
                )
                .onChange(of: ambientViewModel.parameters.didgeridooVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Snap
                MixerSliderRow(
                    label: "Snap",
                    icon: "timelapse",
                    value: $ambientViewModel.parameters.snapVolume,
                    accentColor: .teal
                )
                .onChange(of: ambientViewModel.parameters.snapVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Drum
                MixerSliderRow(
                    label: "Slow Drum",
                    icon: "record.circle.fill",
                    value: $ambientViewModel.parameters.drumVolume,
                    accentColor: .red
                )
                .onChange(of: ambientViewModel.parameters.drumVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Percussion
                MixerSliderRow(
                    label: "Percussion",
                    icon: "app.background.dotted",
                    value: $ambientViewModel.parameters.percussionVolume,
                    accentColor: .orange
                )
                .onChange(of: ambientViewModel.parameters.percussionVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Purr
                MixerSliderRow(
                    label: "Purr",
                    icon: "cat",
                    value: $ambientViewModel.parameters.purrVolume,
                    accentColor: .blue
                )
                .onChange(of: ambientViewModel.parameters.purrVolume) {
                    ambientViewModel.updateEngineParameters()
                }
                
                // Cosmic
                MixerSliderRow(
                    label: "Cosmic",
                    icon: "sparkles",
                    value: $ambientViewModel.parameters.cosmicVolume,
                    accentColor: .yellow
                )
                .onChange(of: ambientViewModel.parameters.cosmicVolume) {
                    ambientViewModel.updateEngineParameters()
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(UIColor.secondarySystemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        )
    }
}
