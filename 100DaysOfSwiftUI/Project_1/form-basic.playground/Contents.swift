import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    // Structs are immutable, so we need @State to make this mutable
    @State private var name = ""
    
    var body: some View {
        
        Form {
            Section { // Groups form inputs/elements, separated by empty space
                
                // An ordinary text input like any other.
                // $ before state variable "name" means "binding" - two-way connection.
                TextField("Enter your name", text: $name)
                
                Text("Hello, \(name)!") // \(...) = string interpolation (no $ before "name" here)
                
            }
        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
