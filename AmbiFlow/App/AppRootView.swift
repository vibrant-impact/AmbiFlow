//
//  AppRootView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

//
//  AppRootView.swift
//  AmbiFlow
//

import SwiftUI

struct AppRootView: View {
    @StateObject private var ambientViewModel =
        AmbientViewModel()
    
    // Set this to true to show the welcome screen every launch.
    @State private var isWelcomePresented = true
    
    var body: some View {
        let activeTheme = AppTheme.current(
            for: ambientViewModel.parameters.scale,
            accentOverride:
                ambientViewModel.currentSoundscapeAccent
        )
        
        ZStack {
            mainApplicationView(theme: activeTheme)
            
            if isWelcomePresented {
                WelcomeView(
                    theme: activeTheme,
                    dismissAction: dismissWelcome
                )
                .transition(
                    .asymmetric(
                        insertion: .opacity.combined(
                            with: .scale(scale: 0.92)
                        ),
                        removal: .opacity.combined(
                            with: .scale(scale: 1.06)
                        )
                    )
                )
                .zIndex(1)
            }
        }
        .animation(
            .easeInOut(duration: 0.45),
            value: isWelcomePresented
        )
        .environment(
            \.colorScheme,
            .dark
        )
        .onChange(of: ambientViewModel.parameters) {
            _, _ in
            
            ambientViewModel.updateEngineParameters()
        }
    }
    
    // MARK: - Main Application View
    
    @ViewBuilder
    private func mainApplicationView(
        theme: AppTheme
    ) -> some View {
        NavigationStack {
            ZStack {
                theme.bgGradient
                    .ignoresSafeArea()
                
                ScrollView(
                    .vertical,
                    showsIndicators: false
                ) {
                    VStack(spacing: 24) {
                        header(theme: theme)
                        
                        playbackPanel(theme: theme)
                        
                        visualizer(theme: theme)
                        
                        UnifiedControlConsoleView(
                            ambientViewModel: ambientViewModel
                        )
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                }
            }
        }
    }
    
    // MARK: - Header
    
    private func header(theme: AppTheme) -> some View {
        
        HStack(alignment: .top) {
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                HStack(spacing: 8) {
                    AmbiFlowLogoView(
                            isAnimating: ambientViewModel.isPlaying,
                            size: 50,
                            glowColor: theme.accentColor
                        )
                    
                    Text("AmbiFlow")
                        .font(
                            .system(
                                size: 34,
                                weight: .bold
                            )
                        )
                        .foregroundColor(.white)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            NavigationLink {
                PlaylistsView(
                    viewModel: ambientViewModel
                )
            } label: {
                Image(systemName: "folder.fill")
                    .font(
                        .system(
                            size: 24,
                            weight: .bold
                        )
                    )
                    .foregroundColor(.yellow)
                    .padding(10)
                    .background(
                        Color.yellow.opacity(0.12)
                    )
                    .clipShape(Circle())
            }
            .accessibilityLabel("Open playlists")
        }
        .padding(.top, 16)
    }
    
    // MARK: - Playback Panel
    
    private func playbackPanel(theme: AppTheme) -> some View {
        HStack(spacing: 16) {
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                Text("Endless Generation Engine")
                    .font(
                        .system(
                            .caption,
                            design: .monospaced
                        )
                    )
                    .bold()
                    .foregroundColor(theme.accentColor)
                
                Text(
                    ambientViewModel.isPlaying
                    ? "Immersive audio is active"
                    : "Initiate unique ambient audio"
                )
                .font(.subheadline.bold())
                .foregroundColor(.white)
                
                Text(ambientViewModel.currentSoundscapeName)
                    .font(
                        .system(
                            .caption2,
                            design: .monospaced
                        )
                    )
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.black.opacity(0.6))                    .foregroundColor(theme.accentColor)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(
                                theme.accentColor.opacity(0.3),
                                lineWidth: 0.5
                            )
                    }
                
            }
            
            Spacer()
            
            Button {
                ambientViewModel.togglePlayback()
            } label: {
                Image(
                    systemName: ambientViewModel.isPlaying
                    ? "pause.fill"
                    : "play.fill"
                )
                .font(.title2)
                .foregroundColor(.black)
                .frame(width: 56, height: 56)
                .background {
                    Circle()
                        .fill(
                            ambientViewModel.isPlaying
                            ? Color.red
                            : theme.accentColor
                        )
                }
                .shadow(
                    color: (
                        ambientViewModel.isPlaying
                        ? Color.red
                        : theme.accentColor
                    )
                    .opacity(0.3),
                    radius: 10
                )
            }
            .accessibilityLabel(
                ambientViewModel.isPlaying
                ? "Pause soundscape"
                : "Play soundscape"
            )
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
    
    // MARK: - Visualizer
    
    private func visualizer(theme: AppTheme) -> some View {
        let isGenerativeVoiceActive =
            ambientViewModel.parameters.isInstrumentActive &&
            ambientViewModel.parameters.instrumentVolume > 0
        
        return WaveformVisualizerView(
            activeNoteName: ambientViewModel.activeNoteName,
            activeNoteFrequency:
                ambientViewModel.activeNoteFrequency,
            lfoRate: ambientViewModel.parameters.lfoRate,
            isPlaying: ambientViewModel.isPlaying,
            audioLevel:
                ambientViewModel.audioLevelMonitor.level,
            isGenerativeVoiceActive:
                isGenerativeVoiceActive
        )
        .padding()
        .background(Color.black.opacity(0.2))
        .cornerRadius(20)
    }
    
    // MARK: - Welcome
    
    private func dismissWelcome() {
        withAnimation(
            .easeInOut(duration: 0.45)
        ) {
            isWelcomePresented = false
        }
    }
}
