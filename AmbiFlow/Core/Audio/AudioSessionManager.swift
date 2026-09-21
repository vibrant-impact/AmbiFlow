//
//  AudioSessionManager.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import AVFoundation

final class AudioSessionManager {
    func configure() throws {
        let session = AVAudioSession.sharedInstance()
        
        try session.setCategory(
            .playback,
            mode: .default,
            options: [.mixWithOthers]
        )
        
        try session.setActive(true)
    }
}
