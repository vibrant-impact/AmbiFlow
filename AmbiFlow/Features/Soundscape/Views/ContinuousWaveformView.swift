//
//  ContinuousWaveformView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct ContinuousWaveformView: View {
    let isEnginePlaying: Bool
    let audioLevel: Float
    
    @State private var waveformPhaseShift: Double = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let centerY = height / 2
                
                guard width > 0 else {
                    return
                }
                
                path.move(
                    to: CGPoint(
                        x: 0,
                        y: centerY
                    )
                )
                
                let safeLevel = max(
                    0.04,
                    min(1.0, audioLevel * 1.5)
                )

                let baseAmplitude =
                    isEnginePlaying
                    ? height * 0.22
                    : height * 0.04

                let audioAmplitude =
                    height * 0.65 * CGFloat(safeLevel)
                
                let totalAmplitude =
                    baseAmplitude + audioAmplitude
                
                for x in stride(
                    from: CGFloat(0),
                    through: width,
                    by: 2
                ) {
                    let normalizedX = x / width
                    
                    let primaryWave = sin(
                        normalizedX * .pi * 4
                        + waveformPhaseShift
                    )
                    
                    let secondaryWave = sin(
                        normalizedX * .pi * 8
                        - waveformPhaseShift * 0.6
                    )
                    
                    // Tapers the wave near the left and right edges.
                    let envelope = sin(
                        normalizedX * .pi
                    )
                    
                    let combinedWave =
                        primaryWave * 0.75
                        + secondaryWave * 0.25
                    
                    let y =
                        centerY
                        + combinedWave
                        * envelope
                        * totalAmplitude
                    
                    path.addLine(
                        to: CGPoint(
                            x: x,
                            y: y
                        )
                    )
                }
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            .indigo.opacity(0.5),
                            .teal,
                            .indigo.opacity(0.5)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                style: StrokeStyle(
                    lineWidth: 3,
                    lineCap: .round,
                    lineJoin: .round
                )
            )
        }
        .frame(height: 58)
        .opacity(isEnginePlaying ? 1.0 : 0.45)
        .onAppear {
            withAnimation(
                .linear(duration: 2.0)
                    .repeatForever(autoreverses: false)
            ) {
                waveformPhaseShift = .pi * 2
            }
        }
    }
}
