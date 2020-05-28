//
//  GameViewController.swift
//  AnimationTest
//
//  Created by ninjanazal on 28/05/2020.
//  Copyright © 2020 ninjanazal. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // cria uma instancia da gamescene
            let scene = GameScene(size: view.bounds.size)
            // define o tipo de escalamento
            scene.scaleMode = .resizeFill
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
            // apresenta a cena
            view.presentScene(scene);
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
