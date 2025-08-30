import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"] // three unique values
    @State private var selectedStudent = "Harry" // default value must be one of the three above
    
    var body: some View {
        
        // NavigationStack is required to have a navigation bar
        NavigationStack {
            Form {
                // "Picker" is like a drop down menu.
                //
                // "$" before selectedStudent means "bind to this variable".
                //
                // Similar to React.js's looped component additions (think: table rows),
                // each view added by the ForEach loop needs to be uniquely identifiable.
                // The names themselves in the array are unique, so we can use them as IDs.
                // Each unique ID-able value in the array can be represented by an automatically
                // generated token called "\.self".
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) { student in
                        Text(student)
                    }
                    // Shorthand version of the above, allowed because we
                    // passed a closure to ForEach
                    /*
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                    */
                }
            }
            // Navigation bar title must go on the Form, NOT the NavigationStack!
            // The code below will update the navigation bar title with the selected student name.
            // No reason, it's just a demo of dynamic titles.
            .navigationTitle("Selected Student: \(selectedStudent)")
            .navigationBarTitleDisplayMode(.inline) // uses smaller font for title
        }

    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
