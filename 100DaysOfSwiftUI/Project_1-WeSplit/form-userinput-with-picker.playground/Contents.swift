import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    // @State makes these variables mutable
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    
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
                
                // Picker is like a drop down menu.
                // "$" before numberOfPeople means "bind to this variable".
                // This loops through numbers 2 to 99 (2..<100) and creates
                // a picker option for each number. We're starting with 2, but
                // indices of sets of values start at 0 so index 0 is 2,
                // index 1 is 3, and index 2 is 4. So, the default value of
                // the picker below will display as "4 people", not "2 people",
                // because the value of numberOfPeople at index 2 is 4. If you
                // want to display the user's choice separate from this picker,
                // you'll need to accommodate by adjusting the value at the
                // chosent index (i.e. subtract the default value of the picker,
                // in this case 2. So, if the user chooses index 5, the value
                // shown will be "7 people" unless you subtract 2 to get the actual
                // number of people).
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
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
