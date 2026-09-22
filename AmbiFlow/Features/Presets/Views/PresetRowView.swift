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
    let accentColor: Color?
    
    init(
        title: String,
        subtitle: String,
        isLoaded: Bool,
        theme: AppTheme,
        action: @escaping () -> Void,
        deleteAction: (() -> Void)?,
        accentColor: Color? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.isLoaded = isLoaded
        self.theme = theme
        self.action = action
        self.deleteAction = deleteAction
        self.accentColor = accentColor
    }
    
    private var displayAccentColor: Color {
        accentColor ?? theme.accentColor
    }
    
    var body: some View {
        HStack {
            Button(action: action) {
                VStack(
                    alignment: .leading,
                    spacing: 2
                ) {
                    Text(title)
                        .font(.caption.bold())
                        .foregroundColor(
                            isLoaded
                            ? displayAccentColor
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
                    isPlaying: false,
                    accentColor: displayAccentColor
                )
            }
            
            if let deleteAction {
                Button(action: deleteAction) {
                    Image(systemName: "trash")
                        .font(.caption)
                        .foregroundColor(
                            .red.opacity(0.7)
                        )
                }
            } else if !isLoaded {
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundColor(
                        .slate.opacity(0.5)
                    )
            }
        }
        .padding(10)
        .background(
            isLoaded
            ? displayAccentColor.opacity(0.18)
            : Color.black.opacity(0.2)
        )
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    isLoaded
                    ? displayAccentColor.opacity(0.45)
                    : Color.clear,
                    lineWidth: 1
                )
        }
    }
}
