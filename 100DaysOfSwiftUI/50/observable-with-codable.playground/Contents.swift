import SwiftUI
import PlaygroundSupport // Required for Playground preview support

@Observable
class User: Codable {
    // Tells Swift to use specific names for JSON properties.
    // @Observable adds underscores as well as properties that we
    // may not want. This enum will say what we want and how to name
    // the wanted properties.
    //
    // MUST be called "CodingKeys" and MUST be of type CodingKey (no "s")
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    var name = "Taylor"
}

struct ContentView: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        
        // Should print "{"name":"Taylor"}" in the debug area
        // if the enum above is set up correctly.
        print(str)
    }

}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
