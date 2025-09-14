import SwiftUI
import PlaygroundSupport // Required for Playground preview support

struct ContentView: View {
    var body: some View {
        
        // Vertical stack, aligned to the leading (left) edge
        VStack(alignment: .leading) {
            Spacer() // Adds a set amount of space
            Text("First")
            Text("Second")
            Text("Third")
            Spacer() // You can increase spacing by using more Spacer()s
            Spacer()
        }
        
        // Horizontal stack, spacing between items is 20 points
        HStack(spacing: 20) {
            Text("Hello, world!")
            Text("This is inside a HStack")
        }

        // Depth (z-index) stack. These lines are unreadable.
        // Alignment is set like in VStack, but it's depth-based
        // so (alignment: .top) would align everything closest
        // to the viewer. Stacking is bottom to top, or back to front if that helps.
        ZStack {
            Text("Hello, world!")
            Text("This is inside a ZStack")
        }
        
        // If you want content to go under the "safe area" (not always
        // recommended, but there are times when it's useful), just
        // use the .ignoresSafeArea() modifier on the view you want
        // to extend:
        //
        // ZStack {
        //     Color.red
        //     Text("This is inside a ZStack")
        // }
        // .ignoresSafeArea()
        //
        // If content is only decorative, it should be okay under the safe area.
        //
        // Materials are also possible, which adapt to light/dark mode and
        // apply a blur effect to whatever is behind them.
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        
        // Obvious...
        Spacer()
        Spacer()
        VStack(alignment: .leading) {
            HStack {
                Text("Row 1 Column 1")
                Text("Row 1 Column 2")
                Text("Row 1 Column 3")
            }
            Spacer()
            HStack {
                Text("Row 2 Column 1")
                Text("Row 2 Column 2")
                Text("Row 2 Column 3")
            }
            Spacer()
            HStack {
                Text("Row 3 Column 1")
                Text("Row 3 Column 2")
                Text("Row 3 Column 3")
            }
            Spacer()
            Spacer()
        }
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
