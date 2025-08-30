import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    // @State makes this variable mutable
    @State private var checkAmount = 0.0
    
    var body: some View {
        
        Form {
            Section {
                // The attributes should be fairly easy to understand without
                // too much explanation. The "$" before checkAmount means
                // "bind to this variable", so it will change the value of the
                // variable when the user inputs a value in the form's "Amount" field.
                // That value will become formatted based on the current locale of
                // the user, or "USD" as a fallback if locale can't be gleaned.
                // The keyboard type modifier add a popup number pad for number
                // entry.
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            
            // Just like input is represented with a locale-specific format,
            // display uses a locale-specific format.
            Section {
                Text("Amount entered: \(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
            }
        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
