import SwiftUI

struct UnifiedControlConsoleView: View {
    @ObservedObject var ambientViewModel: AmbientViewModel
    
    @State private var selectedTab: SoundscapeControlTab = .melody
    
    var body: some View {
        VStack(spacing: 16) {
            SoundscapeControlTabBar(
                selectedTab: $selectedTab
            )
            
            selectedTabContent
        }
        .animation(
            .easeInOut(duration: 0.2),
            value: selectedTab
        )
    }
    
    @ViewBuilder
    private var selectedTabContent: some View {
        switch selectedTab {
        case .melody:
            melodyTab
            
        case .atmosphere:
            atmosphereTab
            
        case .generative:
            generativeTab
        }
    }
    
    // MARK: - Main Melody Tab
    
    private var melodyTab: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Label(
                    "Main Melody",
                    systemImage: "music.note.house.fill"
                )
                .font(.headline)
                .foregroundColor(.indigo)
                
                Spacer()
                
                Toggle(
                    "",
                    isOn: $ambientViewModel.parameters.isBaseMelodyActive
                )
                .labelsHidden()
                .tint(.indigo)
            }
            
            if ambientViewModel.parameters.isBaseMelodyActive {
                BaseMelodyCarouselView(
                    selectedMelodyOption:
                        $ambientViewModel.parameters.selectedBaseMelodyLoop
                )
                
                MixerSliderRow(
                    label: "Main Melody Volume",
                    icon: "speaker.wave.3.fill",
                    value:
                        $ambientViewModel.parameters.baseMelodyVolume,
                    sliderRange: 0.0...1.0,
                    displayDivisor: 1.0,
                    accentColor: .indigo
                )
                .onChange(
                    of: ambientViewModel.parameters.baseMelodyVolume
                ) {
                    ambientViewModel.updateEngineParameters()
                }
            } else {
                inactiveMessage(
                    text: "Main melody is turned off."
                )
            }
        }
        .controlCardStyle()
    }
    
    // MARK: - Atmosphere Tab
    
    private var atmosphereTab: some View {
        SoundscapeMixerCard(
            ambientViewModel: ambientViewModel
        )
    }
    
    // MARK: - Generative Tab
    
    private var generativeTab: some View {
        GenerativeVoiceCard(
            parameters: $ambientViewModel.parameters
        )
    }
    
    // MARK: - Shared Helpers
    
    private func inactiveMessage(text: String) -> some View {
        Text(text)
            .font(.caption)
            .foregroundColor(.slate)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(.vertical, 8)
    }
}
