//
//  AudioFileLoader.swift
//  AmbiFlow
//
//  Created by stephanie otteson on 2026-09-19.
//

import AVFoundation

struct AudioFileLoader {
    
    enum AudioFileError: LocalizedError {
        case fileNotFound(String)
        case bufferCreationFailed(String)
        
        var errorDescription: String? {
            switch self {
            case .fileNotFound(let fileName):
                return "\(fileName).wav could not be found in the application bundle."
                
            case .bufferCreationFailed(let fileName):
                return "Could not create an audio buffer for \(fileName)."
            }
        }
    }
    
    func loadURL(fileName: String) throws -> URL {
        guard let url = Bundle.main.url(
            forResource: fileName,
            withExtension: "wav"
        ) else {
            throw AudioFileError.fileNotFound(fileName)
        }
        
        return url
    }
    
    func loadBuffer(fileName: String) throws -> AVAudioPCMBuffer {
        let fileURL = try loadURL(fileName: fileName)
        let audioFile = try AVAudioFile(forReading: fileURL)
        
        let format = audioFile.processingFormat
        let frameCount = AVAudioFrameCount(audioFile.length)
        
        guard let buffer = AVAudioPCMBuffer(
            pcmFormat: format,
            frameCapacity: frameCount
        ) else {
            throw AudioFileError.bufferCreationFailed(fileName)
        }
        
        try audioFile.read(into: buffer)
        
        return buffer
    }
}
