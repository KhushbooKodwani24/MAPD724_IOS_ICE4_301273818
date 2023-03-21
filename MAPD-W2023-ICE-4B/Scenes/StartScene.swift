
import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

class StartScene: SKScene
{
    
    var Ocean1: ocean?
    var Ocean2: ocean?
    
    override func sceneDidLoad()
    {
        name = "START"
        
        //add the first ocean in scene
        Ocean1 = ocean()
        Ocean1?.Reset()
        addChild(Ocean1!)
        
        //add the second ocean in scene
        Ocean2 = ocean()
        Ocean2?.position.y = -627
        addChild(Ocean2!)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        Ocean1?.Update()
        Ocean2?.Update()
    }
}
