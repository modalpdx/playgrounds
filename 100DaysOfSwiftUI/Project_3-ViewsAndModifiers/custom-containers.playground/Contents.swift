import SwiftUI
import PlaygroundSupport // Required for Playground preview support

// Our custom container
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    // content below can also be a @ViewBuilder. If declared
    // as a @ViewBuilder, there will be no need to wrap the
    // Image() and Text() in ContentView's HStack with an HStack.
    // The code will build a singular view for each row/column pair
    // automatically so no View-based wrapper will be needed.
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            // Must include id: \.self for ForEach loops with ranges
            // so each iteration can be identified by Swift
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }}
            }
        }
    }
    
    
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
