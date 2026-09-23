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
    
    // MARK: - Soundscape 1
    
    private static let soundscape1: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .groundingHandpan
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.75
        
        parameters.selectedInstrument = .steelTongueDrum
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.67
        
        parameters.melodyIntervalDelay = 1.85
        parameters.scale = .hirajoshi
        
        parameters.oceanVolume = 0.25
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.67
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.49
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Zenith Drift",
            description: "Grounding handpan layered with meditative steel tongue drum over distant waves and a deep purr drone.",
            parameters: parameters,
            accent: .indigo
        )
    }()
    
    // MARK: - Soundscape 2
    
    private static let soundscape2: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .somaticPulse
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.75
        
        parameters.selectedInstrument = .bass
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.49
        
        parameters.melodyIntervalDelay = 2.2
        parameters.scale = .hirajoshi
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.61
        parameters.didgeridooVolume = 0.35
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.46
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Somatic Awakening",
            description: "Warm sub-bass pulses woven with airy didgeridoo tones for centered physical grounding.",
            parameters: parameters,
            accent: .gold
        )
    }()
    
    // MARK: - Soundscape 3
    
    private static let soundscape3: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .celestialVoices
        parameters.isBaseMelodyActive = false
        parameters.baseMelodyVolume = 0.5
        
        parameters.selectedInstrument = .vibraphone
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.7
        
        parameters.melodyIntervalDelay = 2.6
        parameters.scale = .aMinorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.25
        parameters.deepDroneVolume = 0.42
        parameters.airyDroneVolume = 0.5
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.26
        
        return CuratedPreset(
            name: "Starfall Vibraphone",
            description: "Glowing vibraphone sparkles floating over subtle hearth crackle and expansive cosmic undertones.",
            parameters: parameters,
            accent: .blue
        )
    }()
    
    // MARK: - Soundscape 4
    
    private static let soundscape4: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .dreamtime
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.50
        
        parameters.selectedInstrument = .magicMallet
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.68
        
        parameters.melodyIntervalDelay = 0.7
        parameters.scale = .eLydian
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.22
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.36
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Dreamtime Mallets",
            description: "Fast, shimmering mallet arpeggios dancing across gentle rainfall and an uplifting Lydian scale.",
            parameters: parameters,
            accent: .pink
        )
    }()
    
    // MARK: - Soundscape 5
    
    private static let soundscape5: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .angelicFrequencies
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.89
        
        parameters.selectedInstrument = .bell
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.73
        
        parameters.melodyIntervalDelay = 3.7
        parameters.scale = .cMajorPentatonic
        
        parameters.oceanVolume = 0.61
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.68
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Angelic Shoreline",
            description: "Luminous celestial frequencies paired with resonant temple bells and cascading ocean surf.",
            parameters: parameters,
            accent: .teal
        )
    }()
    
    // MARK: - Soundscape 6
    
    private static let soundscape6: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .etherealWinds
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.7
        
        parameters.selectedInstrument = .taikoDrum
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.61
        
        parameters.melodyIntervalDelay = 1.4
        parameters.scale = .eLydian
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.86
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 1.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.72
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Taiko Solitude",
            description: "Deep, powerful drum resonance cutting through ethereal mountain winds and grounding sub-drones.",
            parameters: parameters,
            accent: .purple
        )
    }()
    
    // MARK: - Soundscape 7
    
    private static let soundscape7: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .innerSanctuary
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.78
        
        parameters.selectedInstrument = .handpan
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.82
        
        parameters.melodyIntervalDelay = 3.7
        parameters.scale = .eLydian
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.62
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.3
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Inner Sanctum",
            description: "Meditative acoustic handpan echoing within a still, low-drone sanctuary.",
            parameters: parameters,
            accent: .orange
        )
    }()
    
    // MARK: - Soundscape 8
    
    private static let soundscape8: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .ancestralRhythm
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 1.0
        
        parameters.selectedInstrument = .bass
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.66
        
        parameters.melodyIntervalDelay = 0.9
        parameters.scale = .hirajoshi
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.65
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.3
        parameters.drumVolume = 1.0
        parameters.percussionVolume = 0.38
        parameters.purrVolume = 0.72
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Ancestral Hearth",
            description: "A hypnotic tribal pulse combining driving acoustic percussion, deep bass, and ancient rhythm.",
            parameters: parameters,
            accent: .indigo
        )
    }()
    
    // MARK: - Soundscape 9
    
    private static let soundscape9: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .resonantBells
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 1.0
        
        parameters.selectedInstrument = .magicMallet
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.38
        
        parameters.melodyIntervalDelay = 1.1
        parameters.scale = .cMajorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.59
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.38
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.28
        
        return CuratedPreset(
            name: "Crystal Aurora",
            description: "Sparkling bell loops met by shimmering mallet textures and airy, cosmic drift.",
            parameters: parameters,
            accent: .gold
        )
    }()
    
    // MARK: - Soundscape 10
    
    private static let soundscape10: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .introspection
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.74
        
        parameters.selectedInstrument = .guitarStrum
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 1.0
        
        parameters.melodyIntervalDelay = 1.3
        parameters.scale = .aMinorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.57
        parameters.deepDroneVolume = 0.73
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.29
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Ember Introspection",
            description: "Intimate acoustic guitar strums resonating beside a warm fireside crackle and subtle didgeridoo.",
            parameters: parameters,
            accent: .blue
        )
    }()
    
    // MARK: - Soundscape 11
    
    private static let soundscape11: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .meandering
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.9
        
        parameters.selectedInstrument = .bell
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.58
        
        parameters.melodyIntervalDelay = 1.2
        parameters.scale = .dDorian
        
        parameters.oceanVolume = 0.4
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.4
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Coastal Meander",
            description: "Playful Dorian bell melodies wandering along rhythmic coastal swells and soothing purr textures.",
            parameters: parameters,
            accent: .pink
        )
    }()
    
    // MARK: - Soundscape 12
    
    private static let soundscape12: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .mysteriousRealms
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.80
        
        parameters.selectedInstrument = .acousticHarp
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.86
        
        parameters.melodyIntervalDelay = 2.0
        parameters.scale = .cMajorPentatonic
        
        parameters.oceanVolume = 0.0
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.53
        parameters.airyDroneVolume = 0.0
        parameters.didgeridooVolume = 0.49
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.33
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Mystic Canopy",
            description: "Delicate acoustic harp patterns drifting over earthy drone hums and grounded rhythmic accents.",
            parameters: parameters,
            accent: .teal
        )
    }()
    
    // MARK: - Soundscape 13
    
    private static let soundscape13: CuratedPreset = {
        var parameters = SoundscapeParameters()
        
        parameters.selectedBaseMelodyLoop = .expansiveDrift
        parameters.isBaseMelodyActive = true
        parameters.baseMelodyVolume = 0.90
        
        parameters.selectedInstrument = .singingBowl
        parameters.isInstrumentActive = true
        parameters.instrumentVolume = 0.62
        
        parameters.melodyIntervalDelay = 2.6
        parameters.scale = .aMinorPentatonic
        
        parameters.oceanVolume = 0.48
        parameters.rainVolume = 0.0
        parameters.fireVolume = 0.0
        parameters.deepDroneVolume = 0.0
        parameters.airyDroneVolume = 0.52
        parameters.didgeridooVolume = 0.0
        parameters.snapVolume = 0.0
        parameters.drumVolume = 0.0
        parameters.percussionVolume = 0.0
        parameters.purrVolume = 0.0
        parameters.cosmicVolume = 0.0
        
        return CuratedPreset(
            name: "Expansive Void",
            description: "Sustained singing bowl harmonics melting into expansive ocean tides and infinite airy space.",
            parameters: parameters,
            accent: .purple
        )
    }()
}
