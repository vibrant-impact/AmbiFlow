//
//  ParticleStore.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

@Observable
final class ParticleStore {
    private(set) var particles: [NoteParticle] = []
    
    func addParticle(
        frequency: Float,
        name: String,
        now: Date = Date()
    ) {
        let minimumFrequency: Float = 110
        let maximumFrequency: Float = 932
        
        let clampedFrequency = min(
            maximumFrequency,
            max(minimumFrequency, frequency)
        )
        
        let logMinimum = log(minimumFrequency)
        let logMaximum = log(maximumFrequency)
        let logFrequency = log(clampedFrequency)
        
        let percentage =
            CGFloat(
                (logFrequency - logMinimum) /
                (logMaximum - logMinimum)
            ) * 0.8 + 0.1
        
        let verticalPosition = CGFloat.random(in: 0.4...0.6)
        
        let color: Color
        
        switch percentage {
        case ..<0.3:
            color = .purple
        case 0.3..<0.5:
            color = .indigo
        case 0.5..<0.7:
            color = .blue
        case 0.7..<0.85:
            color = .sky
        default:
            color = .teal
        }
        
        let particle = NoteParticle(
            name: name,
            frequency: frequency,
            xPercentage: percentage,
            yPosition: verticalPosition,
            color: color,
            spawnTime: now
        )
        
        particles.append(particle)
        
        if particles.count > 15 {
            particles.removeFirst()
        }
    }
    
    func clear() {
        particles.removeAll()
    }
}
