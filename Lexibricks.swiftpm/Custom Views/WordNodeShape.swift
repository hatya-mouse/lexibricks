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
    let capWidth: CGFloat
    let nodePadding: CGFloat
    
    static let left = [
        CGPoint(x: 0.5, y: 0.0),
        CGPoint(x: -0.5, y: 0.5),
        CGPoint(x: 0.5, y: 1.0)
    ]
    
    static let right = [
        CGPoint(x: -0.5, y: 0.0),
        CGPoint(x: 0.5, y: 0.5),
        CGPoint(x: -0.5, y: 1.0)
    ]
    
    init(left lCap: CapType, right rCap: CapType, capWidth: CGFloat, nodePadding: CGFloat) {
        self.lCap = lCap
        self.rCap = rCap
        self.capWidth = capWidth
        self.nodePadding = nodePadding
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            // Get the starting point of the shape
            let startPoint = switch lCap {
            case .angleIn:
                CGPoint(x: capWidth * Self.right[0].x, y: rect.height * Self.right[0].y)
            case .angleOut:
                CGPoint(x: capWidth * Self.left[0].x, y: rect.height * Self.left[0].y)
            case .flat:
                CGPoint(x: 0.0, y: 0.0)
            }
            path.move(to: startPoint)
            
            // Draw the line on the left side
            switch lCap {
            case .angleIn:
                for i in 1...2 {
                    path.addLine(to: CGPoint(x: capWidth * Self.right[i].x, y: rect.height * Self.right[i].y))
                }
            case .angleOut:
                for i in 1...2 {
                    path.addLine(to: CGPoint(x: capWidth * Self.left[i].x, y: rect.height * Self.left[i].y))
                }
            case .flat:
                path.addLine(to: CGPoint(x: 0.0, y: rect.height))
            }
            
            // Draw the line on the right side
            switch rCap {
            case .angleIn:
                WordNodeShape.left.reversed().forEach { point in
                    path.addLine(to: CGPoint(x: rect.maxX + capWidth * point.x, y: rect.height * point.y))
                }
            case .angleOut:
                WordNodeShape.right.reversed().forEach { point in
                    path.addLine(to: CGPoint(x: rect.maxX + capWidth * point.x, y: rect.height * point.y))
                }
            case .flat:
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.height))
                path.addLine(to: CGPoint(x: rect.maxX, y: 0.0))
            }
            
            // Return to the start point
            path.addLine(to: startPoint)
        }
    }
}
