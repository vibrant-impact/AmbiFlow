//
//  CuratedPreset.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import Foundation

struct CuratedPreset: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let parameters: SoundscapeParameters
    let accent: PresetAccent
    
    init(
        id: UUID = UUID(),
        name: String,
        description: String,
        parameters: SoundscapeParameters,
        accent: PresetAccent = .indigo
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.parameters = parameters
        self.accent = accent
    }
}
