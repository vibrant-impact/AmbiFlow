//
//  PresetData.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

enum PresetData {
    
    static let curatedPresets: [CuratedPreset] = [
        deepSpace,
        oceanZen,
        rainyFocus,
        ritualPulse
    ]
    
    // MARK: - Deep Space
    
    private static let deepSpace: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .groundingHandpan
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.55
        
        parameters.selectedInstrument = .gong
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.35
        
        parameters.melodyIntervalDelay = 1.8
        parameters.scale = .eLydian
        
        parameters.oceanVolume = 0.05
        parameters.rainVolume = 0.0
        parameters.droneVolume = 0.65
        parameters.djembeVolume = 0.0
        parameters.shakerVolume = 0.05
        
        return CuratedPreset(
            name: "Deep Space",
            description: "Slow, spacious tones for drifting and contemplation.",
            parameters: parameters
        )
    }()
    
    // MARK: - Ocean Zen
    
    private static let oceanZen: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .groundingHandpan
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.45
        
        parameters.selectedInstrument = .gong
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.25
        
        parameters.melodyIntervalDelay = 2.2
        parameters.scale = .cMajorPentatonic
        
        parameters.oceanVolume = 0.8
        parameters.rainVolume = 0.0
        parameters.droneVolume = 0.2
        parameters.djembeVolume = 0.0
        parameters.shakerVolume = 0.0
        
        return CuratedPreset(
            name: "Ocean Zen",
            description: "Gentle water and sparse melodic movement.",
            parameters: parameters
        )
    }()
    
    // MARK: - Rainy Focus
    
    private static let rainyFocus: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .groundingHandpan
        parameters.isBaseMelodyActive = false
        parameters.baseMelodyVolume = 0.0
        
        parameters.selectedInstrument = .gong
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.2
        
        parameters.melodyIntervalDelay = 2.6
        parameters.scale = .aMinorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.75
        parameters.droneVolume = 0.3
        parameters.djembeVolume = 0.0
        parameters.shakerVolume = 0.0
        
        return CuratedPreset(
            name: "Rainy Focus",
            description: "Soft rainfall with subtle background harmony.",
            parameters: parameters
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let ritualPulse: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .groundingHandpan
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.35
        
        parameters.selectedInstrument = .gong
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.55
        
        parameters.melodyIntervalDelay = 0.7
        parameters.scale = .dDorian
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.droneVolume = 0.25
        parameters.djembeVolume = 0.55
        parameters.shakerVolume = 0.35
        
        return CuratedPreset(
            name: "Ritual Pulse",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters
        )
    }()
}
