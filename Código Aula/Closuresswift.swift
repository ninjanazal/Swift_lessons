import Foundation
 // Closures
var hello : () -> (String) = { return  "Hello"}
var hello2 = {return "Hello 2"}
var hello3 = {"Hello 3"}

// 
var dualString : (String , String) ->    (String) =
 {
    (first, second) -> String in
         return "\(first) \(second)"
 }

 // calls
 print(hello())
 print(hello2())
 print(hello3())

// imprime o tipo da funçao
 print(type(of : hello3))

// imprime call da closure 
print(dualString("test1", "test2"))

// explo de hide irder functions _ Map
var x = [1,2,3,4,5,6]
// funciona como um for, $0 -> para o elemento actual, ou seja, precorre todos os elementos
// adiciona um ao valor
print(x.map{ $0+1 })


var number = [1,2,3,4,5,6]
print(number.filter{$0 % 2 == 0 })