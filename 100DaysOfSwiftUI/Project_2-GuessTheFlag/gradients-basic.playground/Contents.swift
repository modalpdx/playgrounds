import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                Section {
                    
                    LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
                    
                    // Gradient.Stop() can be replaced with .init(), a shortcut
                    /*
                    LinearGradient(stops: [
                        Gradient.Stop(color: .white, location: 0.45),
                        Gradient.Stop(color: .black, location: 0.55),
                    ], startPoint: .top, endPoint: .bottom)
                     */
                    
                    // beginning is center point, then gradient radiates outward
                    //RadialGradient(colors: [.white, .black], center: .center, startRadius: 20, endRadius: 200)
                    
                    // Starts as a horizontal gradient from center to right edge,
                    // then sweeps around clockwise to create a conical gradient
                    //AngularGradient(colors: [.white, .black], center: .center)
                    
                    // .red.gradient is a shortcut for a pre-determined linear gradient.
                    // you have no control over it, and it can only be used as
                    // backgrounds or foregrounds
                    /*
                    Text("Your content")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundStyle(.white)
                        .background(.red.gradient)
                     */
                    
                }
            }
            .navigationTitle("Gradients")}
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
