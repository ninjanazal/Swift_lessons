import SpriteKit
import GameplayKit

// categorias para a fisica
struct PhysicsCategory{
    static let none : UInt32 = 0
    static let all  : UInt32 = UInt32.max
    static let monster : UInt32 = 0b1       // representaçao binaria do numero 1
    static let projectile : UInt32 = 0b10   // representaçao binaria do numero 2
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    //MARK: Vars
    let player = SKSpriteNode(imageNamed: "player") // instancia do jogador (sprite)
    
    
    // metodo que deve ser override para quando está para ser exibida no ecra
    override func didMove(to view: SKView) {
        // define a cor do fundo
        backgroundColor = SKColor.white
        // define a posiçao da sprite
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // adiciona o jogador
        addChild(player)
        
        // activa o conportamento fisico
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        // ciclo infinito, de acçoes com intervalos de 1s
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run(AddMoster),SKAction.wait(forDuration: 1.0)])))
        
    }

    //MARK: Iniciaçao monstro
    // funçao para colocar mob na posiçao do ecra
    private func AddMoster(){
        let monster = SKSpriteNode(imageNamed: "monster")   // define a imagem do monstro
        // calcula um numero aleatorio
        let randomPos = CGPoint(
            x: CGFloat.random(in: size.width * 0.8 ..< size.width - monster.size.width),
            y: CGFloat.random(in: monster.size.height ..< size.height - monster.size.height) )
        
        // atribui a posiçao calculada ao monstro
        monster.position = randomPos
        
        // indica qual é tipo de corpo
        monster.physicsBody = SKPhysicsBody(rectangleOf: monster.size)
        // indica que é dinamico o corpo
        monster.physicsBody?.isDynamic = true
        // qual a categoria a que pertece para teste de colisoes por bit
        monster.physicsBody?.categoryBitMask = PhysicsCategory.monster
        // sobre que categoria deteta colisoes
        monster.physicsBody?.contactTestBitMask = PhysicsCategory.projectile
        // para que nao tenha uma resposta fisica apos a colisao, é marcada como none
        monster.physicsBody?.collisionBitMask = PhysicsCategory.none
        
        // adiciona ao jogo
        addChild(monster)
        

        
        // açao
        // determina o ponto alvo da açao
        let toPoint = CGPoint(x: -monster.size.width, y: randomPos.y)
        let actionMove = SKAction.move(to: toPoint, duration: 4.0)  // açao de deslocamento
        let actionRemove = SKAction.removeFromParent()  // açao de remoçao
        
        monster.run(SKAction.sequence([actionMove,actionRemove])) // chama a açao em sequencia
    }
    
    //MARK: Resposta ao toque
    // toutch
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // guarda a informaçao do toque
        guard let touch = touches.first else {return}
        // guarda a informaçao do toque na cena, posiçao na cena
        let touchLocation = touch.location(in: self)
        
        // instancia o projectil no toque
        let projectile = SKSpriteNode(imageNamed: "projectile")
        projectile.position = player.position
        
        // define o offset da projeçao
        let offset = touchLocation - projectile.position
        // impede que o jogador dispare para tras
        if offset.x < 0 {return}
        
        // indica qual é tipo de corpo
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width * 0.5)
        // indica que é dinamico o corpo
        projectile.physicsBody?.isDynamic = true
        // qual a categoria a que pertece para teste de colisoes por bit
        projectile.physicsBody?.categoryBitMask = PhysicsCategory.projectile
        // sobre que categoria deteta colisoes
        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.monster
        // para que nao tenha uma resposta fisica apos a colisao, é marcada como none
        projectile.physicsBody?.collisionBitMask = PhysicsCategory.none
        projectile.physicsBody?.usesPreciseCollisionDetection = true
        
        // adiciona o projectile como filho da cena
        addChild(projectile)
        
        // determina a direcçao do projectil
        let direction = offset.normalized()
        let amount = direction * 1000   // multiplica pela velocidade á direcçao
        let destination = amount + projectile.position  // determina a posiçao alvo de acordo com a pos inicial
        // cria açao para o movimento do projectil,
        let move = SKAction.move(to: destination, duration: 2.0)
        // acçao para a remoçao do mesmo
        let remove = SKAction.removeFromParent()
        
        // inicia uma sequencia das acçoes definidas anteriormente
        projectile.run(SKAction.sequence([move, remove]))
    }
    
    // funçao chamada sempre que um elemento de fisica contacta com outro corpo
    func didBegin(_ contact: SKPhysicsContact) {
        print("Contact")
    }
}
