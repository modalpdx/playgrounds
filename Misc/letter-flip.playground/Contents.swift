import SwiftUI
import PlaygroundSupport // Required for Playground preview support

// NOTE: As of 10/20/2025, this reliably crashes the playground editor.
// Only run this in a full XCode project, I guess.

struct LetterView: View {
    let letter: String
    let color: Color
    
    var body: some View {
        Text(letter)
            .font(.system(size: 48, weight: .bold, design: .default))
            .foregroundColor(.primary)
            .frame(width: 140, height: 140)
            .background(color)
            .cornerRadius(12)
    }
}

struct ContentView: View {
    @State private var flipped = false
    private let letter = "A"

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                // Front side (gray)
                LetterView(letter: letter, color: Color(.gray))
                    .opacity(flipped ? 0 : 1)
                    .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))

                // Back side (green)
                LetterView(letter: letter, color: Color(.systemGreen))
                    .opacity(flipped ? 1 : 0)
                    .rotation3DEffect(.degrees(flipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
            }
            // Smooth spring animation when `flipped` changes
            .animation(.spring(response: 1, dampingFraction: 0.7, blendDuration: 0), value: flipped)
            .onTapGesture {
                withAnimation {
                    flipped.toggle()
                }
            }

            Spacer()

            // Keep some of the original content for context
            Text("Tap the box to flip")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
