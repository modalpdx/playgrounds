// From 100 Days of SwiftUI course by Paul Hudson

import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var body: some View {
        // Images are brought in with no knowledge of how big they are.
        // Control the view of the image a bit with modifiers, and set
        // a default color to fill the space that will eventually contain
        // the image.
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.red
            // Maybe you'd prefer a spinner instead?
            // ProgressView()
        }
        // Everything above is resizable, but the frame() is fixed to
        // control the size of the image view.
        .frame(width: 200, height: 200)
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
