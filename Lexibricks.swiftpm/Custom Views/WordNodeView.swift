//
//  WordNodeView.swift
//  Lexibricks
//
//  Created by Kasatani Shuntaro on 2026/10/20.
//

import SwiftUI

let nodePadding: CGFloat = 5
let capWidth: CGFloat = 20

struct WordNodeView: View {
    let word: WordNode

    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(word.text)
                .font(.system(size: 20))
                .padding([.horizontal], 12)
                .padding([.vertical], 8)
                .background(
                    WordNodeShape(
                        left: word.lCap,
                        right: word.rCap,
                        capWidth: capWidth,
                        nodePadding: nodePadding
                    )
                    .fill(.teal)
                    .overlay(
                        WordNodeShape(
                            left: word.lCap,
                            right: word.rCap,
                            capWidth: capWidth,
                            nodePadding: nodePadding
                        )
                        .stroke(.gray, style: .init(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    )
                )
        }
    }
}
