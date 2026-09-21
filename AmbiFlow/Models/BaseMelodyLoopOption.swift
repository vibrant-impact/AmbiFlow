//
//  BaseMelodyLoopOption.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import Foundation

enum BaseMelodyLoopOption: String, CaseIterable, Codable {
    case groundingHandpan = "Grounding Handpan"
    case somaticPulse = "Somatic Pulse"
    case celestialVoices = "Celestial Voices"
    case dreamtime = "Dreamtime"
    case angelicFrequencies = "Angelic Frequencies"
    case etherealWinds = "Ethereal Winds"
    case innerSanctuary = "Inner Sanctuary"
    case ancestralRhythm = "Ancestral Rhythm"
    case resonantBells = "Resonant Bells"
    case crystalChimes = "Crystal Chimes"
    case introspection = "Introspection"
    case meandering = "Meandering"
    case mysteriousRealms = "Mysterious Realms"
    case expansiveDrift = "Expansive Drift"
    
    
    
    var audioFileName: String {
        switch self {
        case .groundingHandpan: return "handpan-base"
        case .somaticPulse: return "heartbeat-base"
        case .celestialVoices: return "choir-base"
        case .dreamtime: return "drone-base"
        case .angelicFrequencies: return "angelic-base"
        case .etherealWinds: return "airy-base"
        case .innerSanctuary: return "meditative-base"
        case .ancestralRhythm: return "tribal-base"
        case .resonantBells: return "bells-base"
        case .crystalChimes: return "chimes-base"
        case .introspection: return "calm-base"
        case .meandering: return "guitar-base"
        case .mysteriousRealms: return "mystery-base"
        case .expansiveDrift: return "mystical-base"
        }
    }
}
