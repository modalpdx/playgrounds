import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        
        // displayedComponents limits what is presented to the user
        //DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
        
        // in limits the range of dates the user can select from
        // Date.now... says from now to all future dates
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden() // keep the label but hide it (accessibility)
    }
    
}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
