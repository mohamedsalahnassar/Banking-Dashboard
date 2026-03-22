import SwiftUI
import ScrollAnimationKit

public enum ScrollPreset: String, CaseIterable, Identifiable {
    case parallax = "Parallax"
    case fade = "Fade"
    case zoom = "Zoom"
    case cinematic = "Cinematic"
    case custom = "Custom"
    
    public var id: String { rawValue }
    
    var baseConfig: ScrollEffectConfiguration {
        switch self {
        case .parallax: return ScrollEffectStyle.parallax.configuration
        case .fade: return ScrollEffectStyle.fade.configuration
        case .zoom: return ScrollEffectStyle.zoom.configuration
        case .cinematic: return ScrollEffectStyle.cinematic.configuration
        case .custom: return ScrollEffectStyle.parallax.configuration // Fallback
        }
    }
}

public class AnimationConfigurator: ObservableObject {
    @Published public var config: ScrollEffectConfiguration
    @Published public var selectedPreset: ScrollPreset = .parallax {
        didSet {
            if selectedPreset != .custom {
                config = selectedPreset.baseConfig
            }
        }
    }
    
    public init() {
        self.config = ScrollEffectStyle.parallax.configuration
    }
    
    public func setCustom() {
        if selectedPreset != .custom {
            selectedPreset = .custom
        }
    }
}

public struct DashboardConfiguratorView: View {
    @ObservedObject var configurator: AnimationConfigurator
    @Environment(\.dismiss) var dismiss
    
    public init(configurator: AnimationConfigurator) {
        self.configurator = configurator
    }
    
    public var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Preset Style")) {
                    Picker("Preset", selection: $configurator.selectedPreset) {
                        ForEach(ScrollPreset.allCases) { preset in
                            Text(preset.rawValue).tag(preset)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Constraints & Tracking")) {
                    VStack {
                        Text("Scroll Distance: \(Int(configurator.config.scrollDistance))")
                        Slider(value: Binding(
                            get: { configurator.config.scrollDistance },
                            set: { configurator.config.scrollDistance = $0; configurator.setCustom() }
                        ), in: 100...800, step: 10)
                    }
                    VStack {
                        Text("Hero Height: \(Int(configurator.config.heroHeight))")
                        Slider(value: Binding(
                            get: { configurator.config.heroHeight },
                            set: { configurator.config.heroHeight = $0; configurator.setCustom() }
                        ), in: 250...800, step: 10)
                    }
                }
                
                Section(header: Text("Scale Effect")) {
                    Toggle("Enable Scale", isOn: Binding(
                        get: { configurator.config.scaleEnabled },
                        set: { configurator.config.scaleEnabled = $0; configurator.setCustom() }
                    ))
                    if configurator.config.scaleEnabled {
                        VStack {
                            Text("Min Scale: \(String(format: "%.2f", configurator.config.minScale))")
                            Slider(value: Binding(
                                get: { configurator.config.minScale },
                                set: { configurator.config.minScale = $0; configurator.setCustom() }
                            ), in: 0.1...1.5, step: 0.05)
                        }
                    }
                }
                
                Section(header: Text("Opacity Effect")) {
                    Toggle("Enable Opacity", isOn: Binding(
                        get: { configurator.config.opacityEnabled },
                        set: { configurator.config.opacityEnabled = $0; configurator.setCustom() }
                    ))
                    if configurator.config.opacityEnabled {
                        VStack {
                            Text("Min Opacity: \(String(format: "%.2f", configurator.config.minOpacity))")
                            Slider(value: Binding(
                                get: { configurator.config.minOpacity },
                                set: { configurator.config.minOpacity = $0; configurator.setCustom() }
                            ), in: 0.0...1.0, step: 0.05)
                        }
                    }
                }
                
                Section(header: Text("Blur Effect")) {
                    Toggle("Enable Blur", isOn: Binding(
                        get: { configurator.config.blurEnabled },
                        set: { configurator.config.blurEnabled = $0; configurator.setCustom() }
                    ))
                    if configurator.config.blurEnabled {
                        VStack {
                            Text("Max Blur Radius: \(Int(configurator.config.maxBlurRadius))")
                            Slider(value: Binding(
                                get: { configurator.config.maxBlurRadius },
                                set: { configurator.config.maxBlurRadius = $0; configurator.setCustom() }
                            ), in: 0...50, step: 1)
                        }
                        VStack {
                            Text("Blur Start Threshold: \(String(format: "%.2f", configurator.config.blurStartThreshold))")
                            Slider(value: Binding(
                                get: { configurator.config.blurStartThreshold },
                                set: { configurator.config.blurStartThreshold = $0; configurator.setCustom() }
                            ), in: 0.0...1.0, step: 0.05)
                        }
                    }
                }
                
                Section(header: Text("Parallax Effect")) {
                    Toggle("Enable Parallax", isOn: Binding(
                        get: { configurator.config.parallaxEnabled },
                        set: { configurator.config.parallaxEnabled = $0; configurator.setCustom() }
                    ))
                    if configurator.config.parallaxEnabled {
                        VStack {
                            Text("Parallax Rate: \(String(format: "%.2f", configurator.config.parallaxRate))")
                            Slider(value: Binding(
                                get: { configurator.config.parallaxRate },
                                set: { configurator.config.parallaxRate = $0; configurator.setCustom() }
                            ), in: -1.0...2.0, step: 0.05)
                        }
                    }
                }
                
                Section(header: Text("3D Rotation Effect")) {
                    Toggle("Enable Rotation", isOn: Binding(
                        get: { configurator.config.rotationEnabled },
                        set: { configurator.config.rotationEnabled = $0; configurator.setCustom() }
                    ))
                    if configurator.config.rotationEnabled {
                        VStack {
                            Text("Max Rotation Degrees: \(Int(configurator.config.maxRotationDegrees))")
                            Slider(value: Binding(
                                get: { configurator.config.maxRotationDegrees },
                                set: { configurator.config.maxRotationDegrees = $0; configurator.setCustom() }
                            ), in: -90...90, step: 1)
                        }
                    }
                }
                
                Section(header: Text("Slide Effect")) {
                    Toggle("Enable Slide", isOn: Binding(
                        get: { configurator.config.slideEnabled },
                        set: { configurator.config.slideEnabled = $0; configurator.setCustom() }
                    ))
                    if configurator.config.slideEnabled {
                        VStack {
                            Text("Max Slide Offset: \(Int(configurator.config.maxSlideOffset))")
                            Slider(value: Binding(
                                get: { configurator.config.maxSlideOffset },
                                set: { configurator.config.maxSlideOffset = $0; configurator.setCustom() }
                            ), in: -200...200, step: 5)
                        }
                    }
                }
            }
            .navigationTitle("Animation Tuning")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
