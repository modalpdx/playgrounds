import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        VStack(spacing: 30) {
            Text("Tap the flag of")
            Text(countries[correctAnswer])
            
            ForEach(0..<3) { number in
                Button {
                    print("Flag \(number) was tapped")
                } label: {
                    // TODO: figure out why this is not working!
                    Image(countries[number])
                }
            }
        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
