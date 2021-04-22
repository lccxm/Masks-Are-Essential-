import SwiftUI
import SpriteKit

// red -> infected without mask
// purple -> infected with mask
// gray -> healthy with mask
// white -> healthy without mask

public class SimulationScene: SKScene, SKPhysicsContactDelegate {
    var people: [Person] = []
    var numHealthyNoMask: Int = 2
    var numHealthyMask: Int = 2
    var numInfectedNoMask: Int = 2
    var numInfectedMask: Int = 2
    var shwoingSimulation: Bool = false
    var actionAfterFinish: (() -> Void)?
    
    
    public override func sceneDidLoad() {
        self.backgroundColor = .black
    }
    
    func generateRandom() -> CGFloat {
        var number = Int.random(in: 0...1)
        if number == 0 {
            return -4
        }
        return 4
    }
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        physicsWorld.contactDelegate = self
    }
    
    
    public func populate(){
        people = []
        if numHealthyNoMask > 0 {
            for _ in 1...numHealthyNoMask{
                var p = Person(color: .white, mask: false)
                if self.size.width > 0 {
                    p.x = CGFloat.random(in: 0...size.width)
                    p.y = CGFloat.random(in: 0...size.height)
                    p.addSpeed(vx: generateRandom(), vy: generateRandom())
                }
                people.append(p)
            }
        }
        
        if numHealthyMask > 0 {
            for _ in 1...numHealthyMask {
                var p = Person(color: .gray, mask: true)
                if self.size.width > 0 {
                    p.x = CGFloat.random(in: 0...size.width)
                    p.y = CGFloat.random(in: 0...size.height)
                    p.addSpeed(vx: generateRandom(), vy: generateRandom())
                }
                people.append(p)
            }
        }
        
        if numInfectedNoMask > 0{
            for _ in 1...numInfectedNoMask {
                var p = Person(color: .red, mask: false)
                if self.size.width > 0 {
                    p.x = CGFloat.random(in: 0...size.width)
                    p.y = CGFloat.random(in: 0...size.height)
                    p.addSpeed(vx: generateRandom(), vy: generateRandom())
                }
                people.append(p)
            }
        }
        
        if numInfectedMask > 0 {
            for _ in 1...numInfectedMask {
                var p = Person(color: .purple, mask: true)
                if self.size.width > 0 {
                    p.x = CGFloat.random(in: 0...size.width)
                    p.y = CGFloat.random(in: 0...size.height)
                    p.addSpeed(vx: generateRandom(), vy: generateRandom())
                }
                people.append(p)
            }
        }
    }
    public func draw(){
        self.removeAllChildren()
        
        for i in 0...people.count-1 {
            self.addChild(people[i].getNode())
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        
        var count = 0
        for i in 0...people.count-1 {
            if people[i].color == .red || people[i].color == .purple {
                count += 1
            }
        }
        if count < people.count {
            for i in 0...people.count-1 {
                if people[i].x > size.width || people[i].x < 0 {
                    people[i].vx = -people[i].vx
                }
                if people[i].y > size.height || people[i].y < 0 {
                    people[i].vy = -people[i].vy
                }
                people[i].update()
            }
        }else{
            self.isPaused = true
            actionAfterFinish?()
        }
        draw()
    }
    
    
    public func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        case personCategory | personCategory:
            for i in 0...people.count-1 {
                for j in 0...people.count-1 {
                    if (people[i].personNode == contact.bodyA.node || people[i].personNode == contact.bodyB.node) && (people[j].personNode == contact.bodyA.node || people[j].personNode == contact.bodyB.node) {
                        people[i].bounce()
                        people[j].bounce()
                        people[i].update()
                        people[j].update()
                    }
                }
            }
            
        case personCategory | infectedCategory:
            let num = Int.random(in: 1...10)
            let healthyNode = contact.bodyA.categoryBitMask == personCategory ? contact.bodyA.node! : contact.bodyB.node!
            let infectedNode = contact.bodyA.categoryBitMask == infectedCategory ? contact.bodyA.node! : contact.bodyB.node!
            
            for i in 0...people.count-1 {
                for j in 0...people.count-1 {
                    if (people[i].personNode == healthyNode) && (people[j].personNode == infectedNode) {
                        if people[i].mask && people[j].mask { //both with masks
                            if num <= 3 { // low chance of getting sick
                                people[i].color = .purple
                                people[i].personNode = people[i].getNode()
                            }
                        }else if !people[i].mask && people[j].mask { //healthy without mask
                            if num <= 5 { //medium chance
                                people[i].color = .red
                                people[i].personNode = people[i].getNode()
                            }
                        }else if people[i].mask && !people[j].mask { //sick without mask
                            if num <= 7 {  //high chance
                                people[i].color = .purple
                                people[i].personNode = people[i].getNode()
                            }
                        }else if !people[i].mask && !people[j].mask { //both without mask
                            if num <= 9 { //very high chance
                                people[i].color = .red
                                people[i].personNode = people[i].getNode()
                            }
                        }
                        people[i].bounce()
                        people[j].bounce()
                        people[i].update()
                        people[j].update()
                    }
                }
            }
            
        case infectedCategory | infectedCategory:
            for i in 0...people.count-1 {
                for j in 0...people.count-1 {
                    if (people[i].personNode == contact.bodyA.node || people[i].personNode == contact.bodyB.node) && (people[j].personNode == contact.bodyA.node || people[j].personNode == contact.bodyB.node) {
                        people[i].bounce()
                        people[j].bounce()
                        people[i].update()
                        people[j].update()
                    }
                }
            }
        default:
            break
        }
        
    }
}

public struct SimulationView: View {
    @Binding public var numHealthyNoMask: Int
    @Binding public var numHealthyMask: Int
    @Binding public var numInfectedNoMask: Int
    @Binding public var numInfectedMask: Int
    @Binding public var showingSimulation: Bool
    @State public var isSimulationFinished: Bool = false
    
    
    public init(numHealthyNoMask: Binding<Int>, numHealthyMask: Binding<Int>, numInfectedNoMask: Binding<Int>, numInfectedMask: Binding<Int>, showingSimulation: Binding<Bool>){
        self._numHealthyNoMask = numHealthyNoMask
        self._numHealthyMask = numHealthyMask
        self._numInfectedNoMask = numInfectedNoMask
        self._numInfectedMask = numInfectedMask
        self._showingSimulation = showingSimulation
    }
    
    var scene: SimulationScene = SimulationScene()
    
    public var body: some View {
        ZStack {
            SpriteView(scene: scene)
                    .ignoresSafeArea()
            
            
            if isSimulationFinished {
                VStack {
                    Text("Everyone is infected!")
                        .foregroundColor(.white)
                        .font(.title)
                    Button(action: {
                        numHealthyNoMask = 0
                        numHealthyMask = 0
                        numInfectedNoMask = 0
                        numInfectedMask = 0
                        showingSimulation = false
                    }, label: {
                        Text("Make another simulation")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 14)
                            .background(Color.blue)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .font(.title2)
                    })
                }
                
            }
            
            
        
        
                
        }
        .onAppear(){
                    scene.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    scene.scaleMode = .fill
                    scene.numHealthyNoMask = numHealthyNoMask
                    scene.numHealthyMask = numHealthyMask
                    scene.numInfectedNoMask = numInfectedNoMask
                    scene.numInfectedMask = numInfectedMask
                    scene.shwoingSimulation = showingSimulation
                    scene.actionAfterFinish = {
                        isSimulationFinished = true
                    }
            scene.populate()
        }
    }
}


