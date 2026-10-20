//
//  WordBrick.swift
//  Lexibricks
//
//  Created by Kasatani Shuntaro on 2026/10/20.
//

class WordNode {
    var word: String
    var role: WordRole
    var children: [WordNode]
    var attachedAdverbs: [WordNode]
    
    init(word: String, role: WordRole, children: [WordNode] = [], attachedAdverbs: [WordNode] = []) {
        self.word = word
        self.role = role
        self.children = children
        self.attachedAdverbs = attachedAdverbs
    }
}

enum WordRole {
    case n
    case pron
    case v
    case adj
    case adv
    case aux
    case prep
    case art
    case conj
    case interj
}
