//
//  SavedPresetsView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct SavedPresetsView: View {
    @ObservedObject var viewModel: AmbientViewModel
    let theme: AppTheme
    
    var body: some View {
        Group {
            if viewModel.savedScenes.isEmpty {
                EmptyPresetsView(
                    iconName: "music.note.list",
                    message: "No saved scenes yet."
                )
            } else {
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(viewModel.savedScenes) { scene in
                            let isLoaded =
                                viewModel.parameters == scene.parameters
                            
                            PresetRowView(
                                title: scene.name,
                                subtitle: createdDate(for: scene),
                                isLoaded: isLoaded,
                                theme: theme,
                                action: {
                                    viewModel.loadScene(
                                        scene.parameters,
                                        named: scene.name
                                    )
                                },
                                deleteAction: {
                                    viewModel.deleteScene(sceneId: scene.id)
                                }
                            )
                        }
                    }
                }
            }
        }
    }
    
    private func createdDate(for scene: SavedScene) -> String {
        Date(timeIntervalSince1970: scene.createdAt)
            .formatted(
                date: .abbreviated,
                time: .omitted
            )
    }
}
