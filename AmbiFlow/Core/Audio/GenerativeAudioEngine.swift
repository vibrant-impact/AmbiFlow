import AVFoundation
import Foundation

final class GenerativeAudioEngine {
    
    // MARK: - Audio Graph
    
    private let audioEngine = AVAudioEngine()
    
    private let masterGainNode = AVAudioMixerNode()
    private let instrumentMixerNode = AVAudioMixerNode()
    private let baseMelodyTimePitchNode = AVAudioUnitTimePitch()
    private let delayNode = AVAudioUnitDelay()
    
    let audioLevelMonitor = AudioLevelMonitor()
    
    private let instrumentSamplerNode = AVAudioUnitSampler()
    private let baseMelodyPlayerNode = AVAudioPlayerNode()
    
    // MARK: - Audio Loading
    
    private let fileLoader = AudioFileLoader()
    
    // MARK: - Loop Tracks
    
    private let tracks: [String: AudioLoopTrack] = [
        "ocean": AudioLoopTrack(name: "ocean-loop"),
        "rain": AudioLoopTrack(name: "rain-loop"),
        "fire": AudioLoopTrack(name: "fire-loop"),
        "deep drone": AudioLoopTrack(name: "drone-loop"),
        "airy drone": AudioLoopTrack(name: "low-drone-loop"),
        "didgeridoo": AudioLoopTrack(name: "didgeridoo-loop"),
        "snap": AudioLoopTrack(name: "cym-blinks-loop"),
        "slow drum": AudioLoopTrack(name: "drum-loop"),
        "percussion": AudioLoopTrack(name: "gentle-percussion-loop"),
        "purr": AudioLoopTrack(name: "purr-loop"),
        "cosmic": AudioLoopTrack(name: "cosmic-loop")
    ]
    
    // MARK: - State
    
    private var currentBaseMelodyIdentifier = ""
    private(set) var isEngineRunning = false
    
    // MARK: - Initialization
    
    init() {
        setupAudioGraph()
        audioLevelMonitor.attach(to: masterGainNode)
        loadDefaultAudio()
    }
    
    // MARK: - Setup
    
    private func setupAudioGraph() {
        attachAudioNodes()
        connectAudioNodes()
    }
    
    private func attachAudioNodes() {
        // Main melody and instrument nodes
        audioEngine.attach(baseMelodyPlayerNode)
        audioEngine.attach(instrumentSamplerNode)
        audioEngine.attach(instrumentMixerNode)
        
        // Effects and master nodes
        audioEngine.attach(delayNode)
        audioEngine.attach(masterGainNode)
        audioEngine.attach(baseMelodyTimePitchNode)
        
        // Atmospheric loop nodes
        for track in tracks.values {
            audioEngine.attach(track.playerNode)
        }
    }
    
    private func connectAudioNodes() {
        let outputFormat = audioEngine.outputNode.outputFormat(forBus: 0)
        
        // Instrument path:
        // Sampler → Instrument Mixer → Delay → Master
        audioEngine.connect(
            instrumentSamplerNode,
            to: instrumentMixerNode,
            format: outputFormat
        )
        
        audioEngine.connect(
            instrumentMixerNode,
            to: delayNode,
            format: outputFormat
        )
        
        audioEngine.connect(
            delayNode,
            to: masterGainNode,
            format: outputFormat
        )
        
        // Melody path:
        // Melody Player → Time/Pitch → Master
        audioEngine.connect(
            baseMelodyPlayerNode,
            to: baseMelodyTimePitchNode,
            format: outputFormat
        )
        
        audioEngine.connect(
            baseMelodyTimePitchNode,
            to: masterGainNode,
            format: outputFormat
        )
        
        // Atmospheric paths:
        // Loop Players → Master
        for track in tracks.values {
            audioEngine.connect(
                track.playerNode,
                to: masterGainNode,
                format: outputFormat
            )
        }
        
        // Master → Hardware output
        audioEngine.connect(
            masterGainNode,
            to: audioEngine.outputNode,
            format: outputFormat
        )
    }
    
    private func loadDefaultAudio() {
        loadInstrumentSample(fileName: "acoustic-harp-c")
        updateBaseMelody(audioFileName: "handpan-base")
        loadAtmosphericLoops()
    }
    
    private func loadAtmosphericLoops() {
        for track in tracks.values {
            do {
                try track.loadLoop()
            } catch {
                print(
                    "Could not load \(track.name): " +
                    "\(error.localizedDescription)"
                )
            }
        }
    }
    
    // MARK: - Instrument
    
    func loadInstrumentSample(fileName: String) {
        do {
            let fileURL = try fileLoader.loadURL(fileName: fileName)
            
            try instrumentSamplerNode.loadAudioFiles(at: [fileURL])
            
            print(
                "Successfully loaded \(fileName).wav " +
                "into the sampler node."
            )
        } catch {
            print(
                "Could not load instrument \(fileName): " +
                "\(error.localizedDescription)"
            )
        }
    }
    
    // MARK: - Melody
    
    func updateBaseMelody(audioFileName: String) {
        guard audioFileName != currentBaseMelodyIdentifier else {
            return
        }
        
        do {
            // Load the new file before removing the current melody.
            // This prevents losing the current melody if the new file
            // cannot be found or loaded.
            let newBuffer = try fileLoader.loadBuffer(
                fileName: audioFileName
            )
            
            baseMelodyPlayerNode.stop()
            baseMelodyPlayerNode.reset()
            
            baseMelodyPlayerNode.scheduleBuffer(
                newBuffer,
                at: nil,
                options: [.loops],
                completionHandler: nil
            )
            
            currentBaseMelodyIdentifier = audioFileName
            
            if isEngineRunning {
                baseMelodyPlayerNode.play()
            }
        } catch {
            print(
                "Could not update base melody \(audioFileName): " +
                "\(error.localizedDescription)"
            )
        }
    }
    
    // MARK: - Generative Playback
    
    func playGenerativeNote(
        frequency: Float,
        velocityAmount: UInt8 = 100
    ) {
        guard frequency.isFinite, frequency > 0 else {
            return
        }
        
        // Convert frequency to a MIDI note number.
        let midiNoteNumber =
            69.0 + 12.0 * log2(Double(frequency) / 440.0)
        
        let clampedMIDIValue = max(
            0,
            min(127, Int(midiNoteNumber.rounded()))
        )
        
        let midiNote = UInt8(clampedMIDIValue)
        
        instrumentSamplerNode.startNote(
            midiNote,
            withVelocity: velocityAmount,
            onChannel: 0
        )
    }
    
    // MARK: - Parameter Updates
    
    func updateParameters(
        from soundscapeParameters: SoundscapeParameters
    ) {
        updateMasterParameters(from: soundscapeParameters)
        updateMelodyParameters(from: soundscapeParameters)
        updateInstrumentParameters(from: soundscapeParameters)
        updateAtmosphericParameters(from: soundscapeParameters)
    }
    
    private func updateMasterParameters(
        from parameters: SoundscapeParameters
    ) {
        masterGainNode.outputVolume = parameters.masterVolume
        
        delayNode.delayTime = TimeInterval(parameters.delayTime)
        delayNode.feedback = parameters.delayFeedback * 100
        delayNode.wetDryMix = parameters.delayMix * 100
    }
    
    private func updateMelodyParameters(
        from parameters: SoundscapeParameters
    ) {
        baseMelodyTimePitchNode.rate =
            parameters.baseMelodyPlaybackSpeed
        
        baseMelodyPlayerNode.volume =
            parameters.isBaseMelodyActive
            ? parameters.baseMelodyVolume
            : 0
    }
    
    private func updateInstrumentParameters(
        from parameters: SoundscapeParameters
    ) {
        instrumentMixerNode.outputVolume =
            parameters.isInstrumentActive
            ? parameters.instrumentVolume
            : 0
    }
    
    private func updateAtmosphericParameters(
        from parameters: SoundscapeParameters
    ) {
        tracks["ocean"]?.volume = parameters.oceanVolume
        tracks["rain"]?.volume = parameters.rainVolume
        tracks["fire"]?.volume = parameters.fireVolume
        tracks["deep drone"]?.volume = parameters.deepDroneVolume
        tracks["airy drone"]?.volume = parameters.airyDroneVolume
        tracks["didgeridoo"]?.volume = parameters.didgeridooVolume
        tracks["snap"]?.volume = parameters.snapVolume
        tracks["slow drum"]?.volume = parameters.drumVolume
        tracks["percussion"]?.volume = parameters.percussionVolume
        tracks["purr"]?.volume = parameters.purrVolume
        tracks["cosmic"]?.volume = parameters.cosmicVolume
    }
    
    // MARK: - Engine Controls
    
    func startAudioEngine() {
        guard !isEngineRunning else {
            return
        }
        
        do {
            audioLevelMonitor.attach(to: masterGainNode)
            
            try audioEngine.start()
            
            isEngineRunning = true
            
            configureRandomPanning()
            playAllTracks()
        } catch {
            print(
                "Could not start audio engine: " +
                "\(error.localizedDescription)"
            )
        }
    }
    
    func pauseAudioEngine() {
        guard isEngineRunning else {
            return
        }
        
        audioEngine.pause()
        isEngineRunning = false
    }
    
    func stopAudioEngine() {
        audioEngine.stop()
        
        for track in tracks.values {
            track.stop()
        }
        
        baseMelodyPlayerNode.stop()
        
        audioLevelMonitor.detach(
            from: masterGainNode
        )
        
        isEngineRunning = false
    }
    
    // MARK: - Playback Helpers
    
    private func configureRandomPanning() {
        tracks["rain"]?.pan = Float.random(in: -0.4...0.4)
        tracks["shaker"]?.pan = Float.random(in: -0.4...0.4)
    }
    
    private func playAllTracks() {
        for track in tracks.values {
            track.play()
        }
        
        if !baseMelodyPlayerNode.isPlaying {
            baseMelodyPlayerNode.play()
        }
    }
}
