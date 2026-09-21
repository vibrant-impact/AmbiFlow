//
//  PresetTabButton.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct PresetTabButton: View {
    let title: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(
                    .system(
                        size: 10,
                        weight: isActive ? .bold : .medium,
                        design: .monospaced
                    )
                )
                .padding(.horizontal, 4)
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity)
                .background(
                    isActive
                    ? Color.white.opacity(0.1)
                    : Color.clear
                )
                .foregroundColor(isActive ? .white : .slate)
                .cornerRadius(6)
        }
    }
}
