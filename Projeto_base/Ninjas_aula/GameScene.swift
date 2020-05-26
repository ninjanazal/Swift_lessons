import SpriteKit
import GameplayKit

// categorias para a fisica
struct PhysicsCategory{
    static let none         : UInt32 = 0
    static let all          : UInt32 = UInt32.max
    static let monster      : UInt32 = 0b1          // representaçao binaria do numero 1
    static let projectile   : UInt32 = 0b10         // representaçao binaria do numero 2
    static let player       : UInt32 = 0b11         // representaçao binaria do numero 3
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    //MARK: Vars
    let player = SKSpriteNode(imageNamed: "player") // instancia do jogador (sprite)
    var monstersDestroyed = 0   // numero de monstros eliminados
    var playerLives = 3         // numero de vidas do jogador
    
    var playerText = SKLabelNode();
    var scoreText = SKLabelNode();
    
    // metodo que deve ser override para quando está para ser exibida no ecra
    override func didMove(to view: SKView) {
        // define a cor do fundo
        backgroundColor = SKColor.white
        
        // activa o conportamento fisico
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        //MARK: Definiçao Player
        // define a posiçao da sprite
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        
        // definiçao do corpo fisico do jogador
        // tamanho da caixa de colisao
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        // define que é um corpo dinamico
        player.physicsBody?.isDynamic = true
        // define a categorida
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        // define a categoria como que colide
        player.physicsBody?.contactTestBitMask = PhysicsCategory.monster
        // resposta fisica á colisao
        player.physicsBody?.collisionBitMask = PhysicsCategory.none
        
        // adiciona o jogador
        addChild(player)
        
        
        
        // ciclo infinito, de acçoes com intervalos de 1s
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run(AddMoster),SKAction.wait(forDuration: 1.0)])))
        
        
        let backGroundMusic = SKAudioNode(fileNamed: "background-music-aac.caf")
        backGroundMusic.autoplayLooped = true
        addChild(backGroundMusic)
        
        // lable para mostrar o score
        scoreText.text = "Monsters: \(monstersDestroyed)"
        scoreText.fontColor = SKColor.black
        scoreText.position = CGPoint(x: size.width - 100, y: size.height - 50)
        addChild(scoreText)
        
        // lable para mostrar informaçoes do jogador
        playerText.text = "Lives: \(playerLives)"
        playerText.fontColor = SKColor.green
        playerText.position = CGPoint(x: 100, y: size.height - 50)
        addChild(playerText)
    }

    //MARK: Definiçao monstro
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
        monster.physicsBody?.contactTestBitMask = PhysicsCategory.projectile | PhysicsCategory.player
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
        
        // inicia uma açao para tocar o som ao carregar
        run(SKAction.playSoundFileNamed("pew-pew-lei.caf", waitForCompletion: false))
    }
    
    //MARK: Resposta da colisao
    // funçao chamada sempre que um elemento de fisica contacta com outro corpo
    func didBegin(_ contact: SKPhysicsContact) {
        // para determinar a colisao entre dois corpo, avaliamos que tipo de corpos sao
        var firstBody, secondBody : SKPhysicsBody
        // avalia qual é o monstro e qual o projectil, visto que sao utilizadas valores binarios
        if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
            // se o cor A tiver um numero menor entao este é o monstro
            // e o segundo corpo o projectil
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else{
            //caso Contrário
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        // com operaçoes logicas confirma se ocorreu correctamenta a divisao
        if(firstBody.categoryBitMask == PhysicsCategory.monster) &&
            (secondBody.categoryBitMask == PhysicsCategory.projectile){
            // tenta convertes o node verificado como novas SKSpriteNode
            if let monster = firstBody.node as? SKSpriteNode,
                let projectile = secondBody.node as? SKSpriteNode{
                // caso tenha sido possivel, remove ambos o corpo
                projectile.removeFromParent()
                monster.removeFromParent()
                
                // incrementa o numero de monstros mortos
                monstersDestroyed += 1
                
                // actualiza a informaçao do score
                scoreText.text = "Monsters: \(monstersDestroyed)"
                
                // se o numero de monstros destruidos for superior a
                if(monstersDestroyed > 4){
                    // muda para a cena de game over, com a transiçao definida
                    let reveal = SKTransition.flipHorizontal(withDuration: 1.0)
                    // a cena para que deve transitar, e com a informaçao relevante
                    let gameOverScene = GameOverScene(size: self.size, won: true)
                    // mostra a cena com os parametros definidos anteriormente
                    view?.presentScene(gameOverScene,transition: reveal)
                }
            }
        }
        // com operaçoes logicas confirma se ocorreu correctamenta a divisao
        else if(firstBody.categoryBitMask == PhysicsCategory.monster) &&
            (secondBody.categoryBitMask == PhysicsCategory.player){
            // tenta convertes o node verificado como novas SKSpriteNode
            if let monster = firstBody.node as? SKSpriteNode{
                // caso tenha sido possivel, remove ambos o corpo
                monster.removeFromParent()
                
                // incrementa o numero de monstros mortos
                playerLives -= 1
                
                // actualiza a informaçao do score
                playerText.text = "Lives: \(playerLives)"
                
                // se o numero de monstros destruidos for superior a
                if(playerLives < 1){
                    // muda para a cena de game over, com a transiçao definida
                    let reveal = SKTransition.crossFade(withDuration: 1.0)
                    // a cena para que deve transitar, e com a informaçao relevante
                    let gameOverScene = GameOverScene(size: self.size, won: false)
                    // mostra a cena com os parametros definidos anteriormente
                    view?.presentScene(gameOverScene,transition: reveal)
                }
            }
        }
    }
}
