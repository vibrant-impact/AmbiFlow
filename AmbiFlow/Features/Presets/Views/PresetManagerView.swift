//
//  PresetManagerView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct PresetManagerView: View {
    @ObservedObject var viewModel: AmbientViewModel
    
    @State private var newSceneName = ""
    @State private var activeTab: PresetTab = .presets
    
    private let curatedPresets = PresetData.curatedPresets
    
    var body: some View {
        let theme = AppTheme.current(
            for: viewModel.parameters.scale,
            accentOverride:
                viewModel.currentSoundscapeAccent
        )
        
        VStack(alignment: .leading, spacing: 16) {
            header(theme: theme)
            
            selectedTabContent(theme: theme)
                .frame(maxHeight: 240)
            
            SavePresetForm(
                sceneName: $newSceneName,
                theme: theme,
                saveAction: submitNewPreset
            )
        }
        .padding()
        .background(Color.white.opacity(0.03))
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func selectedTabContent(theme: AppTheme) -> some View {
        switch activeTab {
        case .presets:
            CuratedPresetsView(
                presets: curatedPresets,
                viewModel: viewModel,
                theme: theme
            )
            
        case .saved:
            SavedPresetsView(
                viewModel: viewModel,
                theme: theme
            )
            
        case .community:
            CommunityPresetsView(
                viewModel: viewModel,
                theme: theme
            )
        }
    }
    
    private func header(theme: AppTheme) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Saved Playlists", systemImage: "folder.badge.plus")
                .font(.subheadline)
                .bold()
                .foregroundColor(theme.accentColor)
            
            Text(
                "Save, manage, and toggle customized ambient textures " +
                "as reusable scenes instantly."
            )
            .font(.caption)
            .foregroundColor(.slate)
            
            PresetTabBar(
                selectedTab: $activeTab,
                savedCount: viewModel.savedScenes.count
            )
        }
    }
    
    private func submitNewPreset() {
        let trimmedName = newSceneName
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedName.isEmpty else {
            return
        }
        
        viewModel.saveCurrentScene(named: trimmedName)
        newSceneName = ""
    }
}
