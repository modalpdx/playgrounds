import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var body: some View {
        Button("Delete selection", action: executeDelete)
    }
    
    // view debug section (underneath the bar at the bottom
    // of the Playground UI) to see this output
    func executeDelete() {
        print("Now deleting...")
    }
}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
