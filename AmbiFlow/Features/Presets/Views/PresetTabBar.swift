//
//  PresetTabBar.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct PresetTabBar: View {
    @Binding var selectedTab: PresetTab
    let savedCount: Int
    
    var body: some View {
        HStack(spacing: 4) {
            PresetTabButton(
                title: "Curated",
                isActive: selectedTab == .presets
            ) {
                selectedTab = .presets
            }
            
            PresetTabButton(
                title: "My Saved (\(savedCount))",
                isActive: selectedTab == .saved
            ) {
                selectedTab = .saved
            }
            
            PresetTabButton(
                title: "Community",
                isActive: selectedTab == .community
            ) {
                selectedTab = .community
            }
        }
        .frame(maxWidth: .infinity)
        .padding(2)
        .background(Color.black.opacity(0.3))
        .cornerRadius(8)
    }
}
