//
//  PlaylistsView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-20.
//

import SwiftUI

struct PlaylistsView: View {
    @ObservedObject var viewModel: AmbientViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                PresetManagerView(
                    viewModel: viewModel
                )
                .padding()
            }
        }
        .navigationTitle("Playlists")
        .navigationBarTitleDisplayMode(.inline)
    }
}
