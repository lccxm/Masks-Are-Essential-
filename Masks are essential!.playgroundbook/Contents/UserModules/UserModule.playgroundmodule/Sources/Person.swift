import Foundation
import SpriteKit

let personCategory: UInt32 = 0x1 << 0
let infectedCategory: UInt32 = 0x1 << 1


public struct Person {
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var color: UIColor
    var mask: Bool
    var personNode: SKShapeNode?
    
    var vx: CGFloat = 0
    var vy: CGFloat = 0
    
    init(){
        self.x = 0
        self.y = 0
        self.size = 10
        self.color = .white
        self.mask = false
    }
    
    init(x: CGFloat, y: CGFloat, size: CGFloat, color: UIColor, mask: Bool) {
        self.x = x
        self.y = y
        self.size = size
        self.color = color
        self.mask = mask
    }
    
    init(color: UIColor, mask: Bool) {
        self.color = color
        self.mask = mask
        self.size = 10
        self.x = 0
        self.y = 0
    }
    
    mutating func bounce() {
        self.vx = -self.vx
        self.vy = -self.vy
    }
    
    mutating func addSpeed(vx: CGFloat, vy: CGFloat) {
        self.vx += vx
        self.vy += vy
    }
    
    mutating func update() {
        self.x += self.vx
        self.y += self.vy
    }
    
    mutating func getNode() -> SKShapeNode {
        let node = SKShapeNode(circleOfRadius: size)
        node.fillColor = self.color
        node.lineWidth = 0
        node.position = CGPoint(x: x, y: y)
        node.physicsBody = SKPhysicsBody(circleOfRadius: size)
        if self.color == .red || self.color == .purple {
            node.physicsBody?.categoryBitMask = infectedCategory
        }else {
            node.physicsBody?.categoryBitMask = personCategory
        }
        node.physicsBody?.contactTestBitMask = personCategory | infectedCategory
        self.personNode = node
        return node
    }
}
