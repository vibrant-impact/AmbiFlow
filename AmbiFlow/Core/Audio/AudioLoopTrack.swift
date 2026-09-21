//
//  AudioLoopTrack.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import AVFoundation

final class AudioLoopTrack {
    let name: String
    let playerNode: AVAudioPlayerNode
    
    private let fileLoader: AudioFileLoader
    
    init(
        name: String,
        fileLoader: AudioFileLoader = AudioFileLoader()
    ) {
        self.name = name
        self.fileLoader = fileLoader
        self.playerNode = AVAudioPlayerNode()
    }
    
    func loadLoop() throws {
        let buffer = try fileLoader.loadBuffer(fileName: name)
        
        playerNode.reset()
        
        playerNode.scheduleBuffer(
            buffer,
            at: nil,
            options: [.loops],
            completionHandler: nil
        )
    }
    
    func play() {
        guard !playerNode.isPlaying else {
            return
        }
        
        playerNode.play()
    }
    
    func stop() {
        playerNode.stop()
    }
    
    func reset() {
        playerNode.stop()
        playerNode.reset()
    }
    
    var volume: Float {
        get {
            playerNode.volume
        }
        set {
            playerNode.volume = newValue
        }
    }
    
    var pan: Float {
        get {
            playerNode.pan
        }
        set {
            playerNode.pan = newValue
        }
    }
}
