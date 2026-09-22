//
//  PresetAccent.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-21.
//

import SwiftUI

enum PresetAccent: String {
    case indigo
    case blue
    case teal
    case purple
    case orange
    case pink
    case gold
    
    var color: Color {
        switch self {
        case .indigo:
            return .indigo
        case .blue:
            return .blue
        case .teal:
            return .teal
        case .purple:
            return .purple
        case .orange:
            return .orange
        case .pink:
            return .pink
        case .gold:
            return .yellow
        }
    }
}
