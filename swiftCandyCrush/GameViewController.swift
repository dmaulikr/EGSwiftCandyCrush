//
//  GameViewController.swift
//  swiftCandyCrush
//
//  Created by Eric Gu on 10/29/14.
//  Copyright (c) 2014 Eric Gu. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {
    //properties
    var scene: GameScene!
    var level: Level!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure the view
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        //Create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        level = Level(filename: "Level_3")
        scene.level = level
        scene.addTiles()
        scene.swipeHandler = handleSwipe
        skView.presentScene(scene)
        
        beginGame()
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
    }
    
    func beginGame () {
        shuffle()
    }
    
    func shuffle(){
        let newCookies = level.shuffle()
        scene.addSpritesForCookies(newCookies)
    }
    
    func handleSwipe(swap: Swap) {
        view.userInteractionEnabled = false
        
        level.performSwap(swap)
        
        scene.animateSwap(swap) {
            self.view.userInteractionEnabled = true
        }
    }
}
