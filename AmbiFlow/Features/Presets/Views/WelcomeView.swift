//
//  WelcomeView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-20.
//

import SwiftUI

struct WelcomeView: View {
    let theme: AppTheme
    let dismissAction: () -> Void
    
    @State private var isButtonPressed = false
    
    var body: some View {
        ZStack {
            theme.bgGradient
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 28) {
                    Spacer(minLength: 40)
                    
                    AmbiFlowLogoView(
                        isAnimating: true,
                        size: 120,
                        glowColor: theme.accentColor
                    )
                    
                    VStack(spacing: 10) {
                        Text("Welcome to AmbiFlow")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text(
                            "Create evolving ambient soundscapes " +
                            "shaped by melody, texture, and generative " +
                            "musical patterns."
                        )
                        .font(.body)
                        .foregroundColor(.slate)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    }
                    
                    VStack(spacing: 14) {
                        WelcomeFeatureRow(
                            icon: "play.circle.fill",
                            title: "Listen",
                            description:
                                "Start an endlessly evolving soundscape."
                        )
                        
                        WelcomeFeatureRow(
                            icon: "slider.horizontal.3",
                            title: "Shape",
                            description:
                                "Adjust melody, atmosphere, and generative voice."
                        )
                        
                        WelcomeFeatureRow(
                            icon: "folder.fill",
                            title: "Save",
                            description:
                                "Keep favorite combinations as reusable playlists."
                        )
                    }
                    
                    Button {
                        dismissAction()
                    } label: {
                        Text("Begin Exploring")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(theme.accentColor)
                            .cornerRadius(14)
                            .scaleEffect(
                                isButtonPressed ? 0.97 : 1.0
                            )
                    }
                    .buttonStyle(.plain)
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in
                                withAnimation(.easeOut(duration: 0.1)) {
                                    isButtonPressed = true
                                }
                            }
                            .onEnded { _ in
                                withAnimation(.easeOut(duration: 0.1)) {
                                    isButtonPressed = false
                                }
                            }
                    )
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

private struct WelcomeFeatureRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.orange)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.slate)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(14)
    }
}
