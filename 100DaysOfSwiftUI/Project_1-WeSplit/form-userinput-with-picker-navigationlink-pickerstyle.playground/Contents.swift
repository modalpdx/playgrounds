import SwiftUI
import PlaygroundSupport // Required for Playground preview support

// If you need notes about this playground other than what's shown below, see the
// notes in form-userinput-with-picker.playground. No need to repeat them here.

struct ContentView: View {
    // @State makes these variables mutable
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    // This picker style will open a separate page with picker options
                    // as opposed to opening a popup list like in form-userinput-with-picker.playground.
                    // The user is either sent back to the form after choosing an option or after
                    // clicking a "< Back" link at the top of the picker page. The title of the picker
                    // page matches the title specified as the first parameter of the Picker initializer.
                    // Wrapping the Form in a NavigationStack is required for this to work.
                    .pickerStyle(.navigationLink)
                }
                
                // Just like input is represented with a locale-specific format,
                // display uses a locale-specific format.
                Section {
                    Text("Amount entered: \(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                }
            }
        }
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
