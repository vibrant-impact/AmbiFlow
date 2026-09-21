//
//  PresetTab.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

enum PresetTab: String, CaseIterable, Identifiable {
    case presets
    case saved
    case community
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .presets:
            return "Curated"
        case .saved:
            return "My Saved"
        case .community:
            return "Community"
        }
    }
}
