import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    @State private var userNumber = 0.0
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Enter a number", value: $userNumber, format: .number)
                    .keyboardType(.decimalPad) // playground may not show this
                    .focused($textFieldIsFocused)
            }
            .navigationTitle("Fun With Text")
            .toolbar {
                if(textFieldIsFocused) {
                    Button("Done") {
                        textFieldIsFocused = false
                    }
                }
            }

        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
