//
//  GameScene.swift
//  SwiftKabuto
//
//  Created by HitoshiNakagawa on 2014/09/17.
//  Copyright (c) 2014年 nyakagawan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)

            let skTexture = SKTexture(imageNamed: "majo")
            var textures: [SKTexture] = []
            for var i=0; i<3; ++i {
                let sprSize: CGFloat = CGFloat(32)
                let texW: CGFloat = skTexture.size().width
                let texH: CGFloat = skTexture.size().height
                let r = CGRect(x: CGFloat(i) * sprSize/texW, y: 0, width: sprSize/texW, height: sprSize/texH)
                let t = SKTexture(rect: r, inTexture: skTexture)
                textures.append(t)
            }
            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            let sprite = SKSpriteNode(texture: textures.first)
            
            sprite.xScale = 1
            sprite.yScale = 1
            sprite.position = location
            
            //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            let action = SKAction.animateWithTextures(textures, timePerFrame: 0.2)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
            
            break
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
