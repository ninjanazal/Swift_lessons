import Foundation

// enumerators
// enumeradores para tipo de dispositivo
enum IOSDeviceType{
    case iPhone(String)
    case iPad(String)
    case iWatch
}
// vars de deviceTypes
var myDevice : IOSDeviceType = .iPhone("6")
var otherDevice : IOSDeviceType = .iPhone("x")
var watch : IOSDeviceType = .iWatch

print(myDevice)
print(watch)

// switch para determinar o tipo de dispositivo extraindo o campo
// associado ao valor de enum
switch myDevice {
case .iPhone(let model):
    print("iPhone \(model)")
case .iPad(let model):
    print("iPad \(model)")
case .iWatch:
    print("iWatch")
default:
    print("Not an IOS Device")
}

// 1. You are working on a game in which your character is exploring a grid-like map. 
// You get the original location of the character and the steps he will take.
// A step .Up will increase the y coordinate by 1. 
// A step .Down will decrease the y coordinate by 1. 
// A step .Right will increase the x coordinate by 1. 
// A step .Left will decrease the x coordinate by 1.
// Print the final location of the character after all the steps have been taken.

enum Direction {
    case up
    case down
    case left
    case right
}

var location = (x: 0, y: 0)

var steps: [Direction] = [.up, .up, .left, .down, .left] 

func calculateSteps( steps : [Direction],  loc: (x: Int, y: Int)) -> (x: Int, y: Int)
{
	var location = loc
	for step in steps
	{
		switch step {
			case .up: location.y += 1
			case .down: location.y -= 1
			case .right: location.x += 1
			case .left: location.x -= 1
			default: break
		}
	}
	return location
}
print(calculateSteps(steps: steps, loc: location))

// new location should be (-2, 1)

// 2. 1) Define an enumeration named HandShape with three members: .rock, .paper, .scissors.
//    2) Define an enumeration named MatchResult with three members: .win, .draw, .lose.
//    3) write a function called match that takes two hand shapes and returns a match result. 
//    It should return the outcome for the first player (the one with the first hand shape).
enum HandShape{
    case rock
    case scissors
    case paper
}

enum MatchResult{
    case win
    case draw
    case lose
}

func match(_ first: HandShape, _ second: HandShape) -> MatchResult {
	if (first == second) { return .draw }
	if first == .rock && second == .scissors { return .win }
    if first == .paper && second == .rock {  return .win  }
    if first == .scissors && second == .paper { return .win }
    return .lose
}

var result = match(.rock, .scissors) // win
print(result)

// 3. You are given 2 tuples of a, b type (Int,Int) representing fractions. 
// The first value in the tuple represents the numerator, the second value represents the denominator. 
// Create a function that returns a tuple (Int,Int) that holds the sum of the fractions.

func sum(_ a: (Int, Int),_ b: (Int, Int)) -> (Int, Int)
{
	return (a.0*b.1 + b.0*a.1, a.1 * b.1)
}

var fraq1 = (10, 5)
var fraq2 = (2 ,3)

print(sum(fraq1, fraq2))


// 4. You are given the CoinType enumeration which describes different coin values and moneyArray 
// which has tuples(amount, coinType). 
// Print the total value of the coins in the array.

enum CoinType: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

var moneyArray:[(Int,CoinType)] = [(10,.penny),
    (15,.nickle),
    (3,.quarter),
    (20,.penny),
    (3,.dime),
    (7,.quarter)]
	
var totalMoney = 0

for (amount, coinType) in moneyArray {
    totalMoney += amount * coinType.rawValue
}

print(totalMoney)
print(sum(fraq1,fraq2))