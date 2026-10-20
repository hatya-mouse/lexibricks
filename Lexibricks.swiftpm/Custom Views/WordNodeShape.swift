//
//  WordNodeShape.swift
//  Lexibricks
//
//  Created by Kasatani Shuntaro on 2026/10/20.
//

import SwiftUI

struct WordNodeShape: Shape {
    let lCap: CapType
    let rCap: CapType
    let height: CGFloat
    let textWidth: CGFloat
    let nodePadding: CGFloat
    
    static let left = [
        CGPoint(x: 0.75, y: 0.0),
        CGPoint(x: 0.25, y: 0.5),
        CGPoint(x: 0.75, y: 1.0)
    ]
    
    static let right = [
        CGPoint(x: 0.25, y: 0.0),
        CGPoint(x: 0.75, y: 0.5),
        CGPoint(x: 0.25, y: 1.0)
    ]
    
    init(left lCap: CapType, right rCap: CapType, height: CGFloat, textWidth: CGFloat, nodePadding: CGFloat) {
        self.lCap = lCap
        self.rCap = rCap
        self.height = height
        self.textWidth = textWidth
        self.nodePadding = nodePadding
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let leftCapX: CGFloat = height + textWidth + nodePadding * 2
            
            // Get the starting point of the shape
            let startPoint = switch lCap {
            case .angleIn:
                CGPoint(x: height * Self.right[0].x, y: height * Self.right[0].y)
            case .angleOut:
                CGPoint(x: height * Self.left[0].x, y: height * Self.left[0].y)
            case .flat:
                CGPoint(x: height * 0.5, y: 0)
            }
            path.move(to: startPoint)
            
            // Draw the line on the left side
            switch lCap {
            case .angleIn:
                for i in 1...2 {
                    path.addLine(to: CGPoint(x: height * Self.right[i].x, y: height * Self.right[i].y))
                }
            case .angleOut:
                for i in 1...2 {
                    path.addLine(to: CGPoint(x: height * Self.left[i].x, y: height * Self.left[i].y))
                }
            case .flat:
                path.addLine(to: CGPoint(x: height * 0.5, y: height))
            }
            
            // Draw the line on the right side
            switch rCap {
            case .angleIn:
                WordNodeShape.left.reversed().forEach { point in
                    path.addLine(to: CGPoint(x: leftCapX + height * point.x, y: height * point.y))
                }
            case .angleOut:
                WordNodeShape.right.reversed().forEach { point in
                    path.addLine(to: CGPoint(x: leftCapX + height * point.x, y: height * point.y))
                }
            case .flat:
                path.addLine(to: CGPoint(x: leftCapX + height * 0.5, y: height))
                path.addLine(to: CGPoint(x: leftCapX + height * 0.5, y: 0.0))
            }
            
            // Return to the start point
            path.addLine(to: startPoint)
        }
    }
}
