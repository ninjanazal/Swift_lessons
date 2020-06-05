// funçoes
// determinar qual o valor minimo
func Min(valor1 : Int, valor2 : Int) -> Int{
    //determina qual dos valores é o menos
    return (valor1 < valor2) ? valor2 : valor1
}

// func para determinar o ultimo digito de um inteiro
func LastDigitInt(_ val : Int)-> Int{
    return (val % 10)
}


// valores 
var val1 = 5
var val2 = 29

// determinar o valor minimo entre dois valores
print("Valor1: \(val1)\nValor2: \(val2)\n")
print("Valor minimo: \(Min(valor1: val1,valor2: val2))")

// determinar o ultimo digito de um valor
var val3 = 10892
print("Ultimo digito do valor: \(val3)")
print(LastDigitInt(val3))

