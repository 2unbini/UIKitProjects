//
//  FloorNode.swift
//  Raindrop iOS
//
//  Created by Eunbin Kwon on 2022/03/06.
//

import SpriteKit

class FloorNode: SKNode {
    
    func setup(size: CGSize) {
        let yPos: CGFloat = size.height * 0.25
        let startPoint: CGPoint = CGPoint(x: 70, y: yPos)
        let endPoint: CGPoint = CGPoint(x: size.width - 70, y: yPos)
        
        physicsBody = SKPhysicsBody(edgeFrom: startPoint, to: endPoint)
        physicsBody?.restitution = 0.3
    }
}
