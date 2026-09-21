//
//  SavePresetForm.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

struct SavePresetForm: View {
    @Binding var sceneName: String
    
    let theme: AppTheme
    let saveAction: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Divider()
                .background(Color.white.opacity(0.05))
            
            HStack(spacing: 10) {
                TextField(
                    "Name current soundscape...",
                    text: $sceneName
                )
                .font(.caption)
                .padding(10)
                .background(Color.black.opacity(0.4))
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            Color.white.opacity(0.08),
                            lineWidth: 1
                        )
                }
                .submitLabel(.done)
                .onSubmit {
                    saveAction()
                }
                
                Button(action: saveAction) {
                    HStack(spacing: 4) {
                        Image(systemName: "square.and.arrow.down")
                        Text("Save")
                    }
                    .font(.caption.bold())
                    .foregroundColor(.black)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(theme.accentColor)
                    .cornerRadius(8)
                }
                .disabled(
                    sceneName
                        .trimmingCharacters(
                            in: .whitespacesAndNewlines
                        )
                        .isEmpty
                )
            }
        }
    }
}
