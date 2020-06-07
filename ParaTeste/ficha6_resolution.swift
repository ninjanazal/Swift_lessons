import Foundation
// 1. You are working on a game in which your character is exploring a grid-like map. 
// You get the original location of the character and the steps he will take.
// A step .Up will increase the y coordinate by 1. 
// A step .Down will decrease the y coordinate by 1. 
// A step .Right will increase the x coordinate by 1. 
// A step .Left will decrease the x coordinate by 1.
// Print the final location of the character after all the steps have been taken.
// -----------------------------------  1 -----------------------------
// definiçao do enumerado de direcçoes
enum Directions{
    case Up
    case Down
    case Right
    case Left
}
struct Vector2{
    var x,y : Float
    // inicia o vector
    init(x: Float, y: Float){
        self.x = x
        self.y = y
    }
} 

// operador de adiçao
    func +(left: Vector2, right: Vector2) -> Vector2{
        return Vector2(x: left.x + right.x, y: left.y + right.y)
    }

// class do jogador
class Player{
    var position : Vector2
    init(){
        position = Vector2(x: 0, y: 0)
    }
    // metodo que imprime a posicao do jogador
    public func PrintPlayerPosition(){ print("Player Position: x: \(position.x), y: \(position.y)")}
    // metodo que move o jogador de acordo com um array de steps
    public func MovePlayer(_ steps: [Directions]){
        // para cada elemento do array de direcçoes
        for step in steps{
            // dependendo o passo modifica o valor da posiçao
            switch step {
            case .Up:
                position.y += 1
            case .Down:
                position.y -= 1
            case .Left:
                position.x -= 1
            case .Right:
                position.x += 1
            default:
                fatalError("Unsupported")
            }
        }
    }
}

// array dos passo que o jogador vai dar
var steps : [Directions] = [.Left, .Left, .Up, .Down, .Right, .Up]

// Cria um novo jogador
var newPlayer = Player()
// desloca o jogador de acordo com os passos
newPlayer.MovePlayer(steps)
// indica a posiçao do jogador
newPlayer.PrintPlayerPosition()

// -----------------------------------  2  -----------------------------
// 2. 1) Define an enumeration named HandShape with three members: .rock, .paper, .scissors.
//    2) Define an enumeration named MatchResult with three members: .win, .draw, .lose.
//    3) write a function called match that takes two hand shapes and returns a match result. 
//    It should return the outcome for the first player (the one with the first hand shape).
// enumerado que define a forma da mao
enum HandShape{
    case rock
    case paper
    case scissors
}
// enumerado que define a condiçao de resultado
enum MatchResult{
    case win
    case draw
    case lose
}
// funçao que avalia duas formas de mao e retorna o resultado
func Match(_ leftPlayer: HandShape, _ rightPlayer: HandShape) -> MatchResult{
    // define a forma de empatar e todas as condicoes de vitoria para o jogador da esquerda
        if(leftPlayer == rightPlayer){ return .draw}
        else if (leftPlayer == .rock && rightPlayer == .scissors) {return .win}
        else if (leftPlayer == .paper && rightPlayer == .rock) { return .win}
        else if (leftPlayer == .scissors && rightPlayer == .paper) {return .win}
        else {return .lose}   // caso nenhuma das condiçoes estver satisfeita o jogador perdeu
}
// imprime a partida
print(Match(.rock,.scissors))


// -----------------------------------  3  -----------------------------
// 3. You are given 2 tuples of a, b type (Int,Int) representing fractions. 
// The first value in the tuple represents the numerator, the second value represents the denominator. 
// Create a function that returns a tuple (Int,Int) that holds the sum of the fractions.

// overload ao operador para somar dois tuplos ao tipo de françao
func +(left: (Int,Int), right: (Int,Int)) -> (Int,Int){
    return (left.0 * right.1 + right.0 * left.1,left.1 * right.1)
}

// tupulos 
let tuple1 = (1,2)
let tuple2 = (1,3)
// imprime a soma dos dois tupulos
print(tuple1 + tuple2)

// -----------------------------------  4  -----------------------------
// 4. You are given the CoinType enumeration which describes different coin values and moneyArray 
// which has tuples(amount, coinType). 
// Print the total value of the coins in the array.
// enumerado com o tipo de valor e o seu valor real
enum CoinType : Int{
    case penny      = 1
    case nickle     = 5
    case dime       = 10
    case quarter    = 25
}
// definiçao do array de dinheiro com a sua quantidade e tipo num tupulo
var moneyArray : [(Int, CoinType)] = 
    [(10,.penny),
    (15,.nickle),
    (3,.quarter),
    (20,.penny),
    (3,.dime),
    (7,.quarter)]

// para imprimir a quantidade de valor presente no arrya
var totalmoney : Int = 0
// para cada elemento do array incrementa a quantidade associada
for value in moneyArray{
    totalmoney += value.0 * value.1.rawValue
}

// indica a quantidade existente no array
print("Total value: \(totalmoney)")