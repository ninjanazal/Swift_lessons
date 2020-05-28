import SpriteKit
import GameplayKit

class GameScene: SKScene {    
    //MARK: Vars
    private var bear = SKSpriteNode()
    private var bearWalkingFrames : [SKTexture] = []
    
    override func didMove(to view: SKView) {
        // cor do fundo
        backgroundColor = .white
        
        // constroi o urso
        BuildBear()
    }
    
    //MARK: Bear init
    private func BuildBear(){
        // atlas com as imagens da animaçao
        let bearAnimationAtlas = SKTextureAtlas(named: "BearImages")
        let numImages = bearAnimationAtlas.textureNames.count
        
        // para cada uma das imagens carregadas
        for i in 1...numImages{
            // guarda o nome da imagem
            let bearTextureName = "bear\(i)"
            // adiciona o a imagem com o nome determinado para o array de animaçao
            bearWalkingFrames.append(bearAnimationAtlas.textureNamed(bearTextureName))
        }
        // indica quantas texturas foram carregadas
        print("carregadas: \(bearWalkingFrames.count) frames")
        
        // adicionar o urso á cena
        let firstTexture = bearWalkingFrames[0]
        // define o node
        bear = SKSpriteNode(texture: firstTexture)
        // definir a posiçao, frame indica info sobre o frame
        bear.position = CGPoint(x: frame.midX, y: frame.midY)
        // define a escala do node
        bear.xScale = 0.2
        bear.yScale = 0.2
        
        // adiciona á cena
        addChild(bear)
        // chama a animaçao
        AnimateBear()
    }
    
    // cria animaçao
    private func AnimateBear(){
        bear.run(SKAction.repeatForever(SKAction.animate(with: bearWalkingFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "walkingBearAnim")
    }
    
    // desloca o urso para uma posiçao
    private func MoveBear(location: CGPoint){
        let move = SKAction.move(to: location, duration: 3.0)
        bear.run(move)
    }
    
    //MARK: Touch responce
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Toques disponiveis: \(touches.count)")
        
        // resposta ao toque, guarda o primeiro toque
        guard let touch = touches.first else {return}
        // guarda a localizaçao do toque
        let touchLocation = touch.location(in: self)
        
        // direcçao do usrso
        var direction : CGFloat
       
        // determina se o utilizador carregou á esquerda ou direita do urso
        switch touchLocation.x > bear.position.x {
        case true:
            direction = -1
        case false:
            direction = 1
        }
        
        // roda o urso de acordo com a direcçao
        bear.xScale = abs(bear.xScale) * direction
        
        // desloca o urso para a posiçao
        MoveBear(location: touchLocation)
    }
}
