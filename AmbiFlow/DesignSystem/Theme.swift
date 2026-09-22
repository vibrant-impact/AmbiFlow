//
//  Theme.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

//
//  Theme.swift
//  AmbiFlow
//

import SwiftUI

struct AppTheme {
    let name: String
    let accentColor: Color
    let bgGradient: LinearGradient
    
    // Always derived from accentColor so they never disagree.
    var badgeBg: Color {
        accentColor.opacity(0.15)
    }
    
    private init(
        name: String,
        accentColor: Color,
        bgGradient: LinearGradient
    ) {
        self.name = name
        self.accentColor = accentColor
        self.bgGradient = bgGradient
    }
    
    // MARK: - Theme Selection
    
    static func current(
        for scale: MusicalScale,
        accentOverride: PresetAccent? = nil
    ) -> AppTheme {
        let base = baseTheme(for: scale)
        
        guard let override = accentOverride else {
            return base
        }
        
        // Keep the scale-based gradient,
        // but let the loaded soundscape drive the accent.
        return AppTheme(
            name: base.name,
            accentColor: override.color,
            bgGradient: base.bgGradient
        )
    }
    
    private static func baseTheme(
        for scale: MusicalScale
    ) -> AppTheme {
        switch scale {
        case .hirajoshi:
            return AppTheme(
                name: "Zen Garden",
                accentColor: .teal,
                bgGradient: LinearGradient(
                    colors: [
                        .black,
                        Color(
                            red: 0.01,
                            green: 0.05,
                            blue: 0.05
                        )
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
        case .eLydian:
            return AppTheme(
                name: "Ethereal Aurora",
                accentColor: .purple,
                bgGradient: LinearGradient(
                    colors: [
                        .black,
                        Color(
                            red: 0.04,
                            green: 0.02,
                            blue: 0.06
                        )
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
        case .dDorian:
            return AppTheme(
                name: "Mystical Solstice",
                accentColor: .amber,
                bgGradient: LinearGradient(
                    colors: [
                        .black,
                        Color(
                            red: 0.05,
                            green: 0.04,
                            blue: 0.02
                        )
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
        case .aMinorPentatonic:
            return AppTheme(
                name: "Storm Sanctuary",
                accentColor: .slate,
                bgGradient: LinearGradient(
                    colors: [
                        .black,
                        Color(
                            red: 0.03,
                            green: 0.03,
                            blue: 0.04
                        )
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
        case .cMajorPentatonic:
            return AppTheme(
                name: "Deep Space",
                accentColor: .indigo,
                bgGradient: LinearGradient(
                    colors: [
                        .black,
                        Color(
                            red: 0.02,
                            green: 0.02,
                            blue: 0.05
                        )
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

// MARK: - App Colors

extension Color {
    static let slate = Color(
        red: 0.58,
        green: 0.65,
        blue: 0.75
    )
    
    static let emerald = Color(
        red: 0.06,
        green: 0.73,
        blue: 0.45
    )
    
    static let amber = Color(
        red: 0.96,
        green: 0.62,
        blue: 0.04
    )
    
    static let sky = Color(
        red: 0.22,
        green: 0.65,
        blue: 0.91
    )
}
