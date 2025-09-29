import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        
        Button("Show Alert") {
            showingAlert = true
        }
        // Alert is attached to the button, but it could be attached
        // to any view. The alert will show when the binding condition
        // becomes true. Also: in all likelihood, this will not display
        // inside a Playground.
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK") {
                print("OK tapped")
                showingAlert = false
            }
        } message: {
            Text("Please read this.") // optional message
        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
