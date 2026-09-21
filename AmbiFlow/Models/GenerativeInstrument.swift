//
//  GenerativeInstrument.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import Foundation

enum GenerativeInstrument: String, CaseIterable, Codable {
    case acousticHarp = "acoustic-harp-c"
    case bell = "bell-c"
    case singingBowl = "singing-bowl-c"
    case gong = "gong-c"
    case panFlute = "pan-flute-c"
    case steelTongueDrum = "steel-tongue-drum-c"
    case bass = "bass-c"
    case magicMallet = "magic-mallet-c"
    case guitar = "guitar-c"
    case guitarStrum = "guitar-strum-c"
    case handpan = "handpan-c"
    case piano = "piano-c"
    case taikoDrum = "taiko-drum-c"
    case vibraphone = "vibraphone-c"
    
    var displayName: String {
        switch self {
        case .acousticHarp: return "Acoustic Harp"
        case .bell: return "Bell"
        case .singingBowl: return "Singing Bowl"
        case .gong: return "Gong"
        case .panFlute: return "Pan Flute"
        case .steelTongueDrum: return "Steel Tongue Drum"
        case .bass: return "Bass"
        case .magicMallet: return "Magic Mallet"
        case .guitar: return "Guitar"
        case .guitarStrum: return "Guitar Strum"
        case .handpan: return "Handpan"
        case .piano: return "Piano"
        case .taikoDrum: return "Taiko Drum"
        case .vibraphone: return "Vibraphone"
        }
    }
}
