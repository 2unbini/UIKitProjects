//
//  GameScene.swift
//  Raindrop Shared
//
//  Created by Eunbin Kwon on 2022/03/06.
//

import SpriteKit

class GameScene: SKScene {
    let raindropTexture = SKTexture(imageNamed: "rain_drop")
    private let floorNode = FloorNode()
    private let leftWallNode = WallNode()
    private let rightWallNode = WallNode()
    private let lidNode = LidNode()
        
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        configureFloor()
        configureLid()
        configureWalls()
        initialRaindrop()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        spawnRaindrop()
    }
    
    private func configureFloor() {
        floorNode.setup(size: size)
        addChild(floorNode)
    }
    
    private func configureLid() {
        lidNode.setup(size: size)
        addChild(lidNode)
    }
    
    private func configureWalls() {
        leftWallNode.setup(size: size, xPos: 70)
        rightWallNode.setup(size: size, xPos: size.width - 70)
        addChild(leftWallNode)
        addChild(rightWallNode)
    }
    
    private func initialRaindrop() {
        let initialCount = 100
        
        for _ in 1...initialCount {
            let raindrop = SKSpriteNode(texture: raindropTexture)
            raindrop.physicsBody = SKPhysicsBody(
                texture: raindropTexture,
                size: raindrop.size
            )
            raindrop.position = CGPoint(
                x: size.width / 2,
                y: size.height * 0.5
            )
            
            addChild(raindrop)
        }
    }
    
    private func spawnRaindrop() {
        let raindrop = SKSpriteNode(texture: raindropTexture)
        raindrop.physicsBody = SKPhysicsBody(
            texture: raindropTexture,
            size: raindrop.size
        )
        raindrop.position = CGPoint(
            x: size.width / 2,
            y: size.height * 0.65
        )
        
        addChild(raindrop)
    }
}
