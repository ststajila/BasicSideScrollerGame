//
//  GameScene.swift
//  BasicSideScrollerGame
//
//  Created by STANISLAV STAJILA on 2/26/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
    }
}
