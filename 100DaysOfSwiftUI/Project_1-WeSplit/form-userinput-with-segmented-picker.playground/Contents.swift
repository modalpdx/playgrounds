import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    @State private var tipPercentage = 15 // default
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        
        Form {
            Section("Choose a tip percentage") {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                // This picker style shows each percentage as a button in a horizontal row.
                .pickerStyle(.segmented)

            }
        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
