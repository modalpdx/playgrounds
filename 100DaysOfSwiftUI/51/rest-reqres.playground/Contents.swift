import SwiftUI
import Foundation
import PlaygroundSupport // Required for Playground preview support

// Must be Codable in order to JSONEncode the data in CheckoutView.placeOrder()
@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        // We don't want to save true values for extraFrosting or addSprinkles
        // if we set those to true and then disable special requests.
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    // Decimal is much more accurate than Double. Use Decimal for money. Cast multiplicands.
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50 per cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}

struct CheckoutView: View {
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
                    scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    // Button doesn't like await. It wants immediate action. So,
                    // we place the await code inside a Task{}. Then Button is happy.
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            // no code needed
        } message: {
            Text(confirmationMessage)
        }
    }
    
    // NETWORK PROGRAMMING!
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            // Print the raw response so we can inspect the exact JSON coming back
            if let responseString = String(data: data, encoding: .utf8) {
                print("Server response: \n\(responseString)")
            } else {
                print("Server returned non-text response of \(data.count) bytes")
            }

            // The test API (reqres.in) doesn't return the same JSON shape our `Order` type expects,
            // so decoding `Order.self` from the response will fail with "The data couldn't be read because it is missing".
            // We don't actually need the server's decoded order to show a confirmation, so use our local `order`.
            confirmationMessage = "Your order for \(order.quantity)x \(Order.types[order.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch let decodingError as DecodingError {
            // Provide more information when decoding fails so we can diagnose the missing data
            switch decodingError {
            case .typeMismatch(let type, let context):
                print("Decoding type mismatch for type \(type): \(context.debugDescription)\nCodingPath: \(context.codingPath)")
            case .valueNotFound(let type, let context):
                print("Decoding value not found for type \(type): \(context.debugDescription)\nCodingPath: \(context.codingPath)")
            case .keyNotFound(let key, let context):
                print("Decoding key not found: \(key.stringValue) - \(context.debugDescription)\nCodingPath: \(context.codingPath)")
            case .dataCorrupted(let context):
                print("Decoding data corrupted: \(context.debugDescription)")
            @unknown default:
                print("Unknown decoding error: \(decodingError.localizedDescription)")
            }
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
}


struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Check out") {
                        CheckoutView(order: order)
                    }
                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    
}

// Tell the playground what to show in the Preview pane
PlaygroundPage.current.setLiveView(ContentView())
