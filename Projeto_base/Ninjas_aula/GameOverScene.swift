/// cena de Game over
import SpriteKit

class GameOverScene : SKScene{
    // iniciador da cena
    init(size: CGSize, won : Bool){
        super.init(size: size)
        
        backgroundColor = SKColor.white
        
        // cria uma label para mostrar a informaçao
        let message = won ? "You Won!" : "You Lose :["
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.black
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        // adiciona a cena
        addChild(label)
        
        // sequencia de acçoes para o comportamento da cena
        let seqs = SKAction.sequence([
            // espera 3 segundos
            SKAction.wait(forDuration: 3.0),
            // executa açao transtitiva
            SKAction.run(){
                // cria a transiçao, durançao de 1 segundo
                let reveal = SKTransition.flipHorizontal(withDuration: 1.0)
                // cria a cena para que vai transitar
                let scene = GameScene(size: size)
                // monstra a cena com a transiçao definida anteriormente
                self.view?.presentScene(scene,transition: reveal)
            }])
        
        // executa a sequencia
        run(seqs)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
