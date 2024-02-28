//
//  GameViewController.swift
//  BasicSideScrollerGame
//
//  Created by STANISLAV STAJILA on 2/26/24.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
   
    var play: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
                     UIDevice.current.setValue(value, forKey: "orientation")
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                play = scene as? GameScene
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func moveRight(_ sender: Any) {
    
        play.ball.position.x = play.ball.position.x + 50
        
    }
    
    @IBAction func moveLeft(_ sender: Any) {
        play.ball.position.x = play.ball.position.x - 50
    }
    
    @IBAction func moveUp(_ sender: Any) {
        var launch = SKAction.move(by: CGVector(dx: 0, dy: 500), duration: 0.0)
        play.ball.run(launch)
    }
    
    @IBAction func restart(_ sender: Any) {
        
    }
}
