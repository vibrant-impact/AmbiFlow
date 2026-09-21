//
//  WaveformCanvas.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct WaveformCanvas: View {
    let particles: [NoteParticle]
    let lfoRate: Float
    let isGenerativeVoiceActive: Bool
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                guard isGenerativeVoiceActive else {
                    return
                }
                
                let time = timeline.date.timeIntervalSince1970
                
                drawAmbientWaves(
                    in: &context,
                    size: size,
                    time: time
                )
                
                drawParticles(
                    in: &context,
                    size: size,
                    date: timeline.date
                )
            }
        }
        .frame(height: 160)
        .background(Color.black.opacity(0.4))
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    Color.white.opacity(0.05),
                    lineWidth: 1
                )
        }
    }
    
    private func drawAmbientWaves(
        in context: inout GraphicsContext,
        size: CGSize,
        time: TimeInterval
    ) {
        let width = size.width
        let height = size.height
        let middleY = height / 2
        let waveAngle = time * Double(lfoRate) * 1.5
        
        var path = Path()
        path.move(to: CGPoint(x: 0, y: height))
        
        for index in 0...60 {
            let x = CGFloat(index) / 60 * width
            
            let waveOne =
                sin(
                    CGFloat(index) * 0.05
                    + CGFloat(waveAngle)
                ) * 25
            
            let waveTwo =
                cos(
                    CGFloat(index) * 0.03
                    - CGFloat(waveAngle * 0.5)
                ) * 10
            
            let y = middleY + waveOne + waveTwo
            
            path.addLine(
                to: CGPoint(x: x, y: y)
            )
        }
        
        path.addLine(
            to: CGPoint(x: width, y: height)
        )
        
        path.addLine(
            to: CGPoint(x: 0, y: height)
        )
        
        path.closeSubpath()
        
        context.fill(
            path,
            with: .linearGradient(
                Gradient(
                    colors: [
                        Color.indigo.opacity(0.04),
                        Color.purple.opacity(0.12)
                    ]
                ),
                startPoint: CGPoint(
                    x: 0,
                    y: height / 3
                ),
                endPoint: CGPoint(
                    x: 0,
                    y: height
                )
            )
        )
    }
    
    private func drawParticles(
        in context: inout GraphicsContext,
        size: CGSize,
        date: Date
    ) {
        for particle in particles {
            let elapsed = date.timeIntervalSince(
                particle.spawnTime
            )
            
            guard elapsed < 1.8 else {
                continue
            }
            
            let x = particle.xPercentage * size.width
            let y = particle.yPosition * size.height
            
            let opacity = CGFloat(
                max(0, 1 - elapsed / 1.8)
            )
            
            let scale = CGFloat(
                0.1 + elapsed / 1.8 * 2.1
            )
            
            let radius = 20 * scale
            
            let ringRect = CGRect(
                x: x - radius,
                y: y - radius,
                width: radius * 2,
                height: radius * 2
            )
            
            let ringPath = Path(
                ellipseIn: ringRect
            )
            
            context.stroke(
                ringPath,
                with: .color(
                    particle.color.opacity(
                        Double(opacity * 0.6)
                    )
                ),
                lineWidth: 1.5
            )
        }
    }
}
