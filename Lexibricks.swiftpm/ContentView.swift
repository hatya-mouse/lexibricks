import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 0.0) {
                WordNodeView(word: WordNode("", left: .flat, right: .angleIn))
                WordNodeView(word: WordNode("he", left: .angleOut, right: .angleOut))
                WordNodeView(word: WordNode("died", left: .angleIn, right: .angleIn))
                WordNodeView(word: WordNode("but", left: .angleOut, right: .angleOut))
                WordNodeView(word: WordNode("survived", left: .angleIn, right: .angleIn))
                WordNodeView(word: WordNode("and", left: .angleOut, right: .angleOut))
                WordNodeView(word: WordNode("killed", left: .angleIn, right: .angleIn))
                WordNodeView(word: WordNode("people", left: .angleOut, right: .angleOut))
                WordNodeView(word: WordNode("", left: .angleIn, right: .flat))
            }
        }
    }
}
