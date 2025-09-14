import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var body: some View {
        
        Form {
            // Create 100 rows in a loop. The "0..<100" bit creates
            // a range of numbers from 0 to 99 (100 total), and ForEach
            // creates one line of text for each of those numbers.
            //
            // "number in" populates a variable called "number" containing
            // the current number in the loop, so we can use it inside
            // the loop.
            ForEach(0..<100) { number in
                Text("Row \(number)")
            }
            
            // Swift has a shorthand for this kind of thing (a closure
            // passed into ForEach) that uses $0 to mean "the first
            // parameter passed in" - in this case, the current number.
            // This produces the exact same output as the code above.
            /*
            ForEach(0..<100) {
                Text("Row \($0)")
            }
            */
        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
