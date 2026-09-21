//
//  CommunityPresetsView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct CommunityPresetsView: View {
    @ObservedObject var viewModel: AmbientViewModel
    
    let theme: AppTheme
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 12) {
                if viewModel.isLoadingCommunityScenes {
                    loadingView
                } else if viewModel.communityScenes.isEmpty {
                    emptyView
                } else {
                    communityResults
                }
            }
            .padding(.horizontal, 4)
            .padding(.vertical, 4)
        }
        .onAppear {
            loadCommunityScenesIfNeeded()
        }
    }
    
    private var loadingView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(
                        tint: theme.accentColor
                    )
                )
            
            Text("Discovering soundscapes...")
                .font(.caption)
                .foregroundColor(.slate)
        }
        .padding(.top, 30)
    }
    
    private var emptyView: some View {
        VStack(spacing: 8) {
            Image(systemName: "icloud.slash")
                .font(.title2)
                .foregroundColor(.slate.opacity(0.4))
            
            Text("No community scenes found.")
                .font(.caption)
                .foregroundColor(.slate)
        }
        .padding(.top, 30)
    }
    
    private var communityResults: some View {
        ForEach(viewModel.communityScenes) { scene in
            DiscoverCardView(
                sceneData: scene,
                playAction: {
                    viewModel.loadScene(
                        scene.parameters,
                        named: scene.name
                    )
                    viewModel.updateEngineParameters()
                }
            )
        }
    }
    
    private func loadCommunityScenesIfNeeded() {
        guard viewModel.communityScenes.isEmpty else {
            return
        }
        
        viewModel.fetchCommunityScenes()
    }
}
