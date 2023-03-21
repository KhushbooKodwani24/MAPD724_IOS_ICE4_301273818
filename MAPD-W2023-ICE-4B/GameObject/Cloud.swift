

import GameplayKit
import SpriteKit

class Cloud: GameObject
{
    //constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //update lifecylce function
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 //transperant
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.y <= -902 )
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomaize the verticle speed
        verticleSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomaize the horizontal speed
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        position.y = 876
        // get random number for x position
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        // get random number for y position
        let randomY:Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    //public method
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticleSpeed!
    }
}
