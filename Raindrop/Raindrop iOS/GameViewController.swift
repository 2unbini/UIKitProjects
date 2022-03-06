//
//  GameViewController.swift
//  Raindrop iOS
//
//  Created by Eunbin Kwon on 2022/03/06.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sceneNode = GameScene(size: view.frame.size)
        
        if let view = self.view as? SKView? {
            view?.presentScene(sceneNode)
            view?.ignoresSiblingOrder = true
            view?.showsPhysics = true
            view?.showsFPS = true
            view?.showsNodeCount = true
        }
    }
}
