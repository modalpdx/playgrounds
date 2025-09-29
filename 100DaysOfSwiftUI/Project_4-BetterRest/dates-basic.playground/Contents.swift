import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    
    // Example of getting current date/time info, formatted two ways
    var body: some View {
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now, format: .dateTime.weekday().month().day().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    
    /*
    func exampleDates() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
    }
     */
    
    /*
    func exampleDates() {
        // Reminder: var for mutable variables, let for immutable constants
        var components = DateComponents()
        // Get a date for 8:00 AM today
        components.hour = 8
        components.minute = 0
        // Returns an optional Date? because it might fail.
        // In case it fails, use the nil-coalescing operator to provide a fallback value (.now)
        let date = Calendar.current.date(from: components) ?? .now
    }
     */
    
    // Does not execute in this playground, just a written example of
    // how to get hour and minute components from the current date
    /*
    func exampleDates() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
     */
    
}


// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
