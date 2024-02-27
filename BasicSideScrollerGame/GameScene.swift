//
//  GameScene.swift
//  BasicSideScrollerGame
//
//  Created by STANISLAV STAJILA on 2/26/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball: SKSpriteNode!
    var cam = SKCameraNode()
    var pointsCountLabel: SKLabelNode!
    var points = 0
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        pointsCountLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        self.camera = cam
    }
    
    override func update(_ currentTime: TimeInterval) {
        cam.position = ball.position
        pointsCountLabel.position.x = cam.position.x - 300
        pointsCountLabel.position.y = cam.position.y + 60
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        ball.physicsBody?.velocity.dx = 0
        
        if (contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "coin") || (contact.bodyA.node?.name == "coin" && contact.bodyB.node?.name == "ball"){
            points += 1
            pointsCountLabel.text = "Score: \(points)"
            
            if contact.bodyA.node?.name == "coin"{
                contact.bodyA.node?.removeFromParent()
                ball.physicsBody?.velocity.dx = 0
            } else if contact.bodyB.node?.name == "coin"{
                contact.bodyB.node?.removeFromParent()
                ball.physicsBody?.velocity.dx = 0
            }
        }
    }
}
