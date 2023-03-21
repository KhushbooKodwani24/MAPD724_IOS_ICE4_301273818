//
//  CollisionManager.swift
//  Game724_W2023_ICE_3B
//
//  Created by Parth Maru on 2023-02-05.
//

import GameplayKit
import SpriteKit

class CollisionManager
{
    //get a reference to the GameViewController
    public static var gameViewController : GameViewController?
    
    //Utility Functions
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    
    // collision Function
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject)
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radii = P1Radius + P2Radius
        
        // the collision check - overlaping circles
        if(SquaredDistance(point1: P1, point2: P2) < Radii * Radii)
        {
            //we have a collision
            if(!object2.isColliding!)
            {
                //if object2 is not already colliding
                switch(object2.name)
                {
                case "island":
                    ScoreManager.Score += 100
                    gameViewController?.updateScoreLabel()
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    if(ScoreManager.Score % 2000 == 0)
                    {
                        ScoreManager.Score += 1
                        gameViewController?.updateLivesLabel()
                    }
                    break
                case "cloud":
                    ScoreManager.Lives -= 1
                    gameViewController?.updateLivesLabel()
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    if(ScoreManager.Lives < 1)
                    {
                        gameViewController?.presentEndScene()
                    }
                    break
                default:
                    break
                }
                object2.isColliding = true
            }
        }
    }
}
