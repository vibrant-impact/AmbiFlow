//
//  View+ControlCardStyle.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import SwiftUI

extension View {
    func controlCardStyle() -> some View {
        self
            .padding()
            .background(Color.white.opacity(0.03))
            .cornerRadius(16)
    }
}
