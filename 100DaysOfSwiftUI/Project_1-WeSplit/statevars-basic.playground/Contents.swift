import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    
    // Structs are immutable, so we need @State to make this mutable
    @State private var tapCount = 0
    
    var body: some View {
        
        Button("Tap count: \(tapCount)") { 
            tapCount += 1
        }
        
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
