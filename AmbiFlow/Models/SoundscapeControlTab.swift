//
//  SoundscapeControlTab.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

enum SoundscapeControlTab: String, CaseIterable, Identifiable {
    case melody
    case atmosphere
    case generative
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .melody:
            return "Melody"
        case .atmosphere:
            return "Atmosphere"
        case .generative:
            return "Generative"
        }
    }
    
    var iconName: String {
        switch self {
        case .melody:
            return "music.note"
        case .atmosphere:
            return "cloud.fill"
        case .generative:
            return "waveform.path.ecg"
        }
    }
}
