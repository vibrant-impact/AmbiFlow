//
//  PresetRowView.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct PresetRowView: View {
    let title: String
    let subtitle: String
    let isLoaded: Bool
    let theme: AppTheme
    let action: () -> Void
    let deleteAction: (() -> Void)?
    
    var body: some View {
        HStack {
            Button(action: action) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.caption.bold())
                        .foregroundColor(
                            isLoaded
                            ? theme.accentColor
                            : .white
                        )
                    
                    Text(subtitle)
                        .font(.system(size: 10))
                        .foregroundColor(.slate)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
            }
            
            if isLoaded {
                StatusBadgeView(
                    theme: theme,
                    isPlaying: false
                )
            }
            
            if let deleteAction {
                Button(action: deleteAction) {
                    Image(systemName: "trash")
                        .font(.caption)
                        .foregroundColor(.red.opacity(0.7))
                }
            } else if !isLoaded {
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundColor(.slate.opacity(0.5))
            }
        }
        .padding(10)
        .background(
            isLoaded
            ? theme.badgeBg.opacity(0.3)
            : Color.black.opacity(0.2)
        )
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    isLoaded
                    ? theme.accentColor.opacity(0.3)
                    : Color.clear,
                    lineWidth: 1
                )
        }
    }
}
