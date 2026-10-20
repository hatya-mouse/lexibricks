//
//  WordNode.swift
//  Lexibricks
//
//  Created by Kasatani Shuntaro on 2026/10/20.
//

class WordNode {
    var text: String
    var lCap: CapType
    var rCap: CapType
    
    init(_ text: String, left lCap: CapType, right rCap: CapType) {
        self.text = text
        self.lCap = lCap
        self.rCap = rCap
    }
}
