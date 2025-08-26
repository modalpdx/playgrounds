// From 100 Days of SwiftUI course by Paul Hudson

import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var body: some View {
        // Images are brought in with no knowledge of how big they are.
        // Control the view of the image a bit with modifiers, and set
        // a default color to fill the space that will eventually contain
        // the image.
        //
        // This version uses the "phase" closure to handle success, failure,
        // and loading states.
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        // Everything above is resizable, but the frame() is fixed to
        // control the size of the image view.
        .frame(width: 200, height: 200)
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
