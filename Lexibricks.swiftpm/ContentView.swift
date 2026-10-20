import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            WordNodeView(word: WordNode("he", left: .angleOut, right: .angleIn))
        }
    }
}
