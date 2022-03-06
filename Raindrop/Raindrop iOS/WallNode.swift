//
//  WallNode.swift
//  Raindrop iOS
//
//  Created by Eunbin Kwon on 2022/03/06.
//

import SpriteKit

class WallNode: SKNode {
    
    func setup(size: CGSize, xPos: CGFloat) {
        let yPos: CGFloat = size.height * 0.25
        let startPoint: CGPoint = CGPoint(x: xPos, y: yPos)
        let endPoint: CGPoint = CGPoint(x: xPos, y: yPos + size.height * 0.4)
        
        physicsBody = SKPhysicsBody(edgeFrom: startPoint, to: endPoint)
        physicsBody?.restitution = 0.3
    }
}
