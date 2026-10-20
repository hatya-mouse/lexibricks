//
//  WordNodeView.swift
//  Lexibricks
//
//  Created by Kasatani Shuntaro on 2026/10/20.
//

import SwiftUI

let nodePadding: CGFloat = 5
let height: CGFloat = 40

struct WordNodeView: View {
    @State private var textWidth: CGFloat = 0
    let word: WordNode

    var body: some View {
        ZStack(alignment: .topLeading) {
            WordNodeShape(
                left: word.lCap,
                right: word.rCap,
                height: height,
                textWidth: textWidth,
                nodePadding: nodePadding
            )
            .fill(.teal)
            .overlay(
                WordNodeShape(
                    left: word.lCap,
                    right: word.rCap,
                    height: height,
                    textWidth: textWidth,
                    nodePadding: nodePadding
                )
                .stroke(.gray, style: .init(lineWidth: 4, lineCap: .round, lineJoin: .round))
            )

            Text(word.text)
                .font(.system(size: 20))
                .offset(x: height + nodePadding, y: (height - 24) * 0.5)
                .onGeometryChange(for: CGFloat.self) { proxy in
                    proxy.size.width
                } action: { newWidth in
                    textWidth = newWidth
                }
        }
    }
}
