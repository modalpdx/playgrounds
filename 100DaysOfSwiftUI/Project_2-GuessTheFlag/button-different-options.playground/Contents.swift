import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var body: some View {
        //Button("Delete selection", action: executeDelete)
        
        // Presentation can be changed by adding a role parameter
        // (.destructive = red)
        Button("Delete selection", role: .destructive, action: executeDelete)
        
        VStack {
            // .bordered will be a standard bordered button
            // .borderedProminent will be a filled-in button
            Button("Button 1") { }
                .buttonStyle(.bordered)
                .tint(.mint) // change color of bordered button (no bg otherwise)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            // Custom button with label closure
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            // Graphic button with system image
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }
            
            // Special Label type that combines text and image
            // (not sure how to make the icon precede the text)
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting…")
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
