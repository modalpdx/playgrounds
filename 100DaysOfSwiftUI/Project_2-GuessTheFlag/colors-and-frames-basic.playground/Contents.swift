import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var body: some View {
        
        // Only the text view gets a red background color
        /*
        ZStack {
            Text("Your content")
        }
        .background(.red)
        */
        // Alternately, you could put the background color directly on the text. Same thing.
        
        // Putting the color inside the ZStack makes the entire background red.
        // This works because Color is actually a view, and
        // as ZStacks fill from bottom to top, Color (being the
        // first view) will render and then Text (second) will
        // render on top of it.
        /*
        ZStack {
            Color.red
            Text("Your content")
        }
        */
        
        // Color above fills the entire background of the ZStack,
        // but the Color and Text bits won't fill in the whole
        // UI (only the largest size item will determine the
        // dimentions of the ZStack). Sizing Color with a .frame()
        // can stretch the ZStack wider/taller
        /*
        ZStack {
            Color.red
                .frame(width: 200, height: 200)
            Text("Your content")
        }
        */
        
        // If you want to use min/max sizing, .infinity = maximum.
        // Here, the red background will be at least 200 points wide,
        // maximum infinity, and max height will be 200 points. So,
        // this should appear as a red bar that's 200 points wide and
        // whatever the height of the largest item is (the text).
        ZStack {
            Color.red
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("Your content")
        }
        
        // Color can be defined with predefined tokens (.red, .blue, etc) or
        // with RGB values (0-1 range) like this:
        //
        // Color(red: 0.5, green: 0.2, blue: 0.8)
        //
        // Semantic colors can also be used:
        //
        // Color(.systemBackground) // Adapts to light/dark mode
        // Color(.primary), Color(.secondary) // Adaptive text colors




    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
