//
//  AudioLevelMonitor.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import AVFoundation
import Combine

final class AudioLevelMonitor: ObservableObject {
    @Published private(set) var level: Float = 0.0
    
    private var isAttached = false
    
    func attach(to mixerNode: AVAudioMixerNode) {
        guard !isAttached else {
            return
        }
        
        mixerNode.installTap(
            onBus: 0,
            bufferSize: 1024,
            format: nil
        ) { [weak self] buffer, _ in
            let measuredLevel = Self.calculateRMSLevel(
                from: buffer
            )
            
            DispatchQueue.main.async {
                self?.level = measuredLevel
            }
        }
        
        isAttached = true
    }
    
    func detach(from mixerNode: AVAudioMixerNode) {
        guard isAttached else {
            return
        }
        
        mixerNode.removeTap(onBus: 0)
        isAttached = false
        
        DispatchQueue.main.async {
            self.level = 0.0
        }
    }
    
    private static func calculateRMSLevel(
        from buffer: AVAudioPCMBuffer
    ) -> Float {
        guard
            let channelData = buffer.floatChannelData,
            buffer.frameLength > 0
        else {
            return 0.0
        }
        
        let channelCount = Int(buffer.format.channelCount)
        let frameCount = Int(buffer.frameLength)
        
        var totalPower: Float = 0.0
        
        for channel in 0..<channelCount {
            let samples = channelData[channel]
            
            for frame in 0..<frameCount {
                let sample = samples[frame]
                totalPower += sample * sample
            }
        }
        
        let sampleCount = Float(
            max(1, channelCount * frameCount)
        )
        
        let rootMeanSquare = sqrt(
            totalPower / sampleCount
        )
        
        // Amplify the small RMS values into a useful UI range.
        let normalizedLevel = min(
            1.0,
            rootMeanSquare * 5.0
        )
        
        return normalizedLevel
    }
}
