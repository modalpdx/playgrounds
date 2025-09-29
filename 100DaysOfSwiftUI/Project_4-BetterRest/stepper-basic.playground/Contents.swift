import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    
    var body: some View {
        // step must match the type of the state variable sleepAmount (double).
        // Adding formatted() to sleepAmount below fixes the display so it's not
        // a long decimal, but instead is a clean number that displays only what it
        // needs to (8, 8.25, etc, vs 8.000000, 8.250000, etc).
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            .frame(width: 200)
    }
}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
