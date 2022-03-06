//
//  LidNode.swift
//  Raindrop iOS
//
//  Created by Eunbin Kwon on 2022/03/06.
//

import SpriteKit

class LidNode: SKNode {
    
    func setup(size: CGSize) {
        let yPos = size.height * 0.65
        let startPoint = CGPoint(x: 70, y: yPos)
        let endPoint = CGPoint(x: size.width - 70, y: yPos)
        
        physicsBody = SKPhysicsBody(edgeFrom: startPoint, to: endPoint)
        physicsBody?.restitution = 0.3
    }
}
