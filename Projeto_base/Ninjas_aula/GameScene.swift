import SpriteKit
import GameplayKit

class GameScene: SKScene {
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
        
        // ciclo infinito, de acçoes com intervalos de 1s
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run(AddMoster),SKAction.wait(forDuration: 1.0)])))
        
    }

    
    // funçao para colocar mob na posiçao do ecra
    private func AddMoster(){
        let monster = SKSpriteNode(imageNamed: "monster")   // define a imagem do monstro
        // calcula um numero aleatorio
        let randomPos = CGPoint(
            x: CGFloat.random(in: size.width * 0.5 ..< size.width - monster.size.width),
            y: CGFloat.random(in: monster.size.height ..< size.height - monster.size.height) )
        
        // atribui a posiçao calculada ao monstro
        monster.position = randomPos
        
        // adiciona ao jogo
        addChild(monster)
        
        // açao
        // determina o ponto alvo da açao
        let toPoint = CGPoint(x: -monster.size.width, y: randomPos.y)
        let actionMove = SKAction.move(to: toPoint, duration: 4.0)  // açao de deslocamento
        let actionRemove = SKAction.removeFromParent()  // açao de remoçao
        
        monster.run(SKAction.sequence([actionMove,actionRemove])) // chama a açao em sequencia
        
    }
}
