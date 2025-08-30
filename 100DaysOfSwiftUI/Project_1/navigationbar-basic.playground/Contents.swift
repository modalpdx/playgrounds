import SwiftUI
import PlaygroundSupport // Required for Playground preview support

// Navigation bar @ top of the screen can guarantee your app content
// will appear below the geegaws and doodads at the top of the screen
// like the notch, time, battery etc.

struct ContentView: View {
    var body: some View {
        
        NavigationStack { // Required to have a nav bar
            Form {
                Section {
                    Text("Hello, World!")
                }
            }
            // Note: title goes on element INSIDE NavigationStack,
            // NOT on NavigationStack itself
            .navigationTitle("SwiftUI") // Title in nav bar
            //.navigationBarTitleDisplayMode(.inline) // optional, smaller font for title
        }

    }
}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
