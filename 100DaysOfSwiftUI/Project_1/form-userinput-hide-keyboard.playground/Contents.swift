import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    // @State makes this variable mutable
    @State private var checkAmount = 0.0
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    // NOTE: This playground will not show the keyboard like a real
                    // device would, but the code is correct for a real app.
                    //
                    // When the text field is focused, a keyboard will appear. The app
                    // will not automatically hide the keyboard until focus is removed.
                    // A "Done" button is added below to handle this.
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused) // when this text field is focused, add a button that hides the keyboard
                }
                
                Section {
                    Text("Amount entered: \(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                }
            }
            .navigationTitle("Keyboard Magic") // Title shown at the top of the screen. Do not place on NavigationStack itself.
            .toolbar { // Add a toolbar button to hide the keyboard, placed above the title bar
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false // forcing focus to false will hide the keyboard
                    }
                }
            }
        }
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
