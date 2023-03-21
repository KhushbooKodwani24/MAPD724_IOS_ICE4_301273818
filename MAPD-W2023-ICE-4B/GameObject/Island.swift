
import GameplayKit
import SpriteKit

class Island: GameObject
{
    //constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //update lifecylce function
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        verticleSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.y <= -876 )
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.y = 876
        // get psude random number
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.x = CGFloat(randomX)
        isColliding = false
    }
    
    //public method
    func Move()
    {
        position.y -= verticleSpeed!
    }
}
