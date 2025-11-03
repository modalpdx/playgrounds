import PlaygroundSupport  // Required for Playground preview support
import SwiftUI
import CoreHaptics // enable this if you want to work with Core Haptics, obviously

// Note: this will not produce any haptics whatsoever unless
// this app is running on an iPhone (not a simulator, an actual
// iPhone). Copy/paste this into XCode and deploy to a phone.

// EASY haptics (pre-canned)
/*
struct ContentView: View {
    @State private var counter = 0

    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        // A few EASY options that offer haptically unique experiences
        .sensoryFeedback(.increase, trigger: counter)
        /*
        .sensoryFeedback(
            .impact(flexibility: .soft, intensity: 0.5),
            trigger: counter
        )
        .sensoryFeedback(
            .impact(weight: .heavy, intensity: 1),
            trigger: counter
        )
        */

    }
}
 */

// CORE haptics
struct ContentView: View {
    @State private var engine: CHHapticEngine?

    var body: some View {
        Button("Play Haptic", action: complexSuccess)
            .onAppear(perform: prepareHaptics)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print ("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
