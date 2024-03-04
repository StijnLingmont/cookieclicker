import SwiftUI

struct ContentView: View {
    @Binding var amountClicked : Double
    @Binding var autoClickers : Int
    
    var body: some View {
        VStack {
            CookieIncreaser
            Upgrades
        }
    }
    
    var CookieIncreaser: some View {
        VStack {
            Text("Cookie Clicker")
            
            VStack {
                Button(action: { amountClicked += 1 }) {
                    if let image = UIImage(named: "Cookie") {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .padding()
                    } else {
                        // Handle the case when the image cannot be loaded
                        Text("Image not found.")
                    }
                }
            }
            .padding()
            
            if amountClicked > 0 {
                Text("Cookies collected: \(amountClicked)")
            } else {
                Text("Click the cookie!")
            }
            
        }
        .padding()
    }
    
    func buyAutoClicker() {
        if amountClicked >= 10 {
            autoClickers += 1
            amountClicked -= 10
        }
    }
    
    var Upgrades: some View {
        Button(action: buyAutoClicker ) {
            Text("Buy auto clicker (10 cookies)")
        }
    }
}

//#Preview {
//    var amountClicked = 0
//    ContentView(amountClicked: amountClicked)
//}
