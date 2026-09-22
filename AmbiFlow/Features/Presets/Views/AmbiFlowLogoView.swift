//
//  AmbiFlowLogoView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-21.
//

import SwiftUI

struct AmbiFlowLogoView: View {
    let isAnimating: Bool
    let size: CGFloat
    var glowColor: Color = .purple
    
    @State private var isPulsing = false
    
    var body: some View {
        Image("ambiflow-icon")
            .resizable()
            .scaledToFit()
            .frame(
                width: size,
                height: size
            )
            .scaleEffect(
                isAnimating && isPulsing
                ? 1.05
                : 1.0
            )
            .rotationEffect(
                .degrees(
                    isAnimating && isPulsing
                    ? 1.5
                    : 0
                )
            )
            .shadow(
                color: isAnimating
                ? glowColor.opacity(0.35)
                : Color.clear,
                radius: isAnimating ? 10 : 0
            )
            .animation(
                isAnimating
                ? .easeInOut(
                    duration: 1.6
                )
                .repeatForever(
                    autoreverses: true
                )
                : .easeOut(duration: 0.25),
                value: isPulsing
            )
            .onAppear {
                isPulsing = isAnimating
            }
            .onChange(of: isAnimating) { _, newValue in
                isPulsing = newValue
            }
            .accessibilityLabel("AmbiFlow logo")
    }
}
