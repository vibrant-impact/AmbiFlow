//
//  CuratedPresetsView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct CuratedPresetsView: View {
    let presets: [CuratedPreset]
    
    @ObservedObject var viewModel: AmbientViewModel
    
    let theme: AppTheme
    
    var body: some View {
        Group {
            if presets.isEmpty {
                EmptyPresetsView(
                    iconName: "sparkles",
                    message: "No curated presets available yet."
                )
            } else {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 8) {
                        ForEach(presets) { preset in
                            let isLoaded =
                                viewModel.parameters == preset.parameters
                            
                            PresetRowView(
                                title: preset.name,
                                subtitle: preset.description,
                                isLoaded: isLoaded,
                                theme: theme,
                                action: {
                                    viewModel.loadScene(
                                        preset.parameters,
                                        named: preset.name,
                                        accent: preset.accent
                                    )
                                    
                                    viewModel.updateEngineParameters()
                                },
                                deleteAction: nil,
                                accentColor: preset.accent.color
                            )
                        }
                    }
                }
            }
        }
    }
}
