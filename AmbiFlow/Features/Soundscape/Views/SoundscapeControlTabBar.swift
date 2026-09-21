//
//  SoundscapeControlTabBar.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct SoundscapeControlTabBar: View {
    @Binding var selectedTab: SoundscapeControlTab
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(SoundscapeControlTab.allCases) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.iconName)
                            .font(.caption)
                        
                        Text(tab.title)
                            .font(
                                .system(
                                    size: 10,
                                    weight: selectedTab == tab
                                    ? .bold
                                    : .medium,
                                    design: .monospaced
                                )
                            )
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundColor(
                        selectedTab == tab
                        ? selectedTabColor(tab)
                        : .slate
                    )
                    .background(
                        selectedTab == tab
                        ? selectedTabColor(tab).opacity(0.16)
                        : Color.clear
                    )
                    .cornerRadius(8)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .background(Color.black.opacity(0.3))
        .cornerRadius(10)
    }
    
    private func selectedTabColor(
        _ tab: SoundscapeControlTab
    ) -> Color {
        switch tab {
        case .melody:
            return .indigo
        case .atmosphere:
            return .cyan
        case .generative:
            return .purple
        }
    }
}
