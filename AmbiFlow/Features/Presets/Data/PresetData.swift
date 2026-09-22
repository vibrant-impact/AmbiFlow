//
//  PresetData.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

enum PresetData {
    
    static let curatedPresets: [CuratedPreset] = [
        soundscape1,
        soundscape2,
        soundscape3,
        soundscape4,
        soundscape5,
        soundscape6,
        soundscape7,
        soundscape8,
        soundscape9,
        soundscape10,
        soundscape11,
        soundscape12,
        soundscape13
    ]
    
    // MARK: - Deep Space
    
    private static let soundscape1: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .groundingHandpan
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.55
        
        parameters.selectedInstrument = .steelTongueDrum
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.47
        
        parameters.melodyIntervalDelay = 1.85
        parameters.scale = .hirajoshi
        
        parameters.oceanVolume = 0.05
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.47
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.29
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape1",
            description: "Slow, spacious tones for drifting and contemplation.",
            parameters: parameters,
            accent: .indigo
        )
    }()
    
    // MARK: - Ocean Zen
    
    private static let soundscape2: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .somaticPulse
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.55
        
        parameters.selectedInstrument = .bass
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.29
        
        parameters.melodyIntervalDelay = 2.2
        parameters.scale = .hirajoshi
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.41
        parameters.didgeridooVolume = 0.15
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.26
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape2",
            description: "Gentle water and sparse melodic movement.",
            parameters: parameters,
            accent: .gold
        )
    }()
    
    // MARK: - Rainy Focus
    
    private static let soundscape3: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .celestialVoices
        parameters.isBaseMelodyActive = false
        parameters.baseMelodyVolume = 0.3
        
        parameters.selectedInstrument = .vibraphone
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.5
        
        parameters.melodyIntervalDelay = 2.6
        parameters.scale = .aMinorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.05
        parameters.deepDroneVolume = 0.22
        parameters.airyDroneVolume = 0.3
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.06
        
        return CuratedPreset(
            name: "soundscape3",
            description: "Soft rainfall with subtle background harmony.",
            parameters: parameters,
            accent: .blue
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape4: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .dreamtime
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.30
        
        parameters.selectedInstrument = .magicMallet
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.48
        
        parameters.melodyIntervalDelay = 0.7
        parameters.scale = .eLydian
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.02
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.16
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape4",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .pink
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape5: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .angelicFrequencies
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.69
        
        parameters.selectedInstrument = .bell
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.53
        
        parameters.melodyIntervalDelay = 3.7
        parameters.scale = .cMajorPentatonic
        
        parameters.oceanVolume = 0.41
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.48
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape5",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .teal
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape6: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .etherealWinds
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.5
        
        parameters.selectedInstrument = .taikoDrum
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.41
        
        parameters.melodyIntervalDelay = 1.4
        parameters.scale = .eLydian
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.66
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 1.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.52
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape6",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .purple
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape7: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .innerSanctuary
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.58
        
        parameters.selectedInstrument = .handpan
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.62
        
        parameters.melodyIntervalDelay = 3.7
        parameters.scale = .eLydian
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.42
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.1
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape7",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .orange
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape8: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .ancestralRhythm
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.83
        
        parameters.selectedInstrument = .bass
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.46
        
        parameters.melodyIntervalDelay = 0.9
        parameters.scale = .hirajoshi
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.45
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.1
        parameters.drumVolume = 1.0
        parameters.percussionVolume = 0.18
        parameters.purrVolume = 0.52
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape8",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .indigo
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape9: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .resonantBells
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.83
        
        parameters.selectedInstrument = .magicMallet
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.18
        
        parameters.melodyIntervalDelay = 1.1
        parameters.scale = .cMajorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.39
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.18
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.08
        
        return CuratedPreset(
            name: "soundscape9",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .gold
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape10: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .introspection
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.54
        
        parameters.selectedInstrument = .guitarStrum
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.82
        
        parameters.melodyIntervalDelay = 1.3
        parameters.scale = .aMinorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.37
        parameters.deepDroneVolume = 0.53
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.09
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape10",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .blue
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape11: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .meandering
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.7
        
        parameters.selectedInstrument = .bell
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.38
        
        parameters.melodyIntervalDelay = 1.2
        parameters.scale = .dDorian
        
        parameters.oceanVolume = 0.2
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.2
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape11",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .pink
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape12: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .mysteriousRealms
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.60
        
        parameters.selectedInstrument = .acousticHarp
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.66
        
        parameters.melodyIntervalDelay = 2.0
        parameters.scale = .cMajorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.33
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.29
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.13
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape12",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .teal
        )
    }()
    
    // MARK: - Ritual Pulse
    
    private static let soundscape13: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .expansiveDrift
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.70
        
        parameters.selectedInstrument = .singingBowl
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.42
        
        parameters.melodyIntervalDelay = 2.6
        parameters.scale = .aMinorPentatonic
        
        parameters.oceanVolume = 0.28
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.32
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "soundscape13",
            description: "A rhythmic soundscape with earthy movement.",
            parameters: parameters,
            accent: .purple
        )
    }()
}
