import Foundation
// write a function named min2 that takes two Int values, a and b, and returns the min
func min2(_ a : Int, _ b : Int) ->  Int {
    return (a < b) ? a : b
}

// write a function that takes an Int and returns its last digit. Name the function lastDigit
func lastDigit(numb : Int) -> Int {
    return numb % 10
}

// write a function named first that takes an Int named N and returns an array with the first N numbers starting from 1
func first(_ N : Int) -> [Int] {
    // cria array de ints
    var numbers : [Int] = []
    // precore os numeros passados por parametro, e adiciona ao array
    for number in 1...N
    {numbers.append(number)} 
    return numbers
}
// alternativa mais funcional
func first2(_ N : Int) -> [Int] {
    // gurada um range de 1 ate ao numero passado por paramentro
    let range = 1...N
    // inicia o array com o range
    let array = [Int] (range)
    // retorna o array
    return array
}

// write a function named countdown that takes a number N. The function should print the umbers from N to 1
// with a one second pause in between and then wrte GO; int the end. To make the computer
// wait for one second call the sleep function from the standard library.
// The sleep function takes one parameter, the number of seconds to sleep
func countDownCounter( N : Int) {
    var i = N
    // enquanto i > 0, imprime o valor, sleep e decrementa
    while i > 0 {
        print(i)
        sleep(1)
        i-=1
    }
    // no fim do ciclo imprime GO!
    print("GO!")

}

// main
// min2 func call
print(min2(5,10))
// last digit func call
print(lastDigit(numb : 19))

// countDown call
countDownCounter(N :  5)