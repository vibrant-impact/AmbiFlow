//
//  NoteParticle.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct NoteParticle: Identifiable {
    let id = UUID()
    let name: String
    let frequency: Float
    let xPercentage: CGFloat
    let yPosition: CGFloat
    let color: Color
    let spawnTime: Date
}
