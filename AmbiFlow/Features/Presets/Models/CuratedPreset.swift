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
    
    init(
        id: UUID = UUID(),
        name: String,
        description: String,
        parameters: SoundscapeParameters
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.parameters = parameters
    }
}
