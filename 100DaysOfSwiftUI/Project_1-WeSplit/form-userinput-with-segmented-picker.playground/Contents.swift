import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    @State private var tipPercentage = 20
    
    let tipPercentages = [0, 10, 15, 20, 30]
    
    var body: some View {
        
        Form {
            Section {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
            }
        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
