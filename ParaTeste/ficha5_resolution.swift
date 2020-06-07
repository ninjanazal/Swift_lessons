// ----------------------------- 1 -------------------------
// 1. You are given a dictionary code of type [String:String] which has values for all lowercase letters. 
// The code dictionary represents a way to encode a message. 
// For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz". 
// You are also given a message which contains only lowercase letters and spaces. 
// Use the code dictionary to encode the message and print it.

var code = [    "a" : "b",    "b" : "c",    "c" : "d",    "d" : "e",    "e" : "f",    "f" : "g",    "g" : "h",
                "h" : "i",    "i" : "j",    "j" : "k",    "k" : "l",    "l" : "m",    "m" : "n",    "n" : "o",
                "o" : "p",    "p" : "q",    "q" : "r",    "r" : "s",    "s" : "t",    "t" : "u",    "u" : "v",
                "v" : "w",    "w" : "x",    "x" : "y",    "y" : "z",    "z" : "a" ]

// funçao que codifica uma mensagem utilizando um dicionario
func encodeMsg(_ message : String, _ dictionary : [String : String]) -> String{
    // cria string de saida
    var resultValue = String()
    // avalia cada caracter da string de entrada e compara com o dicionario
    for chr in message{
        // verifica se é um espaço
        resultValue +=  (chr == " ") ? String(chr) : dictionary[String(chr)]!
    }
    // retorna o resultado
    return resultValue
}

// funçao que descodifica uma mensagem
func decodeMsg(_ message : String,_ dictionary : [String : String]) -> String{
    // cria uma string de saida
    var resultValue = String()
    // avalia cada caracter da string de entrada e compara com o dicionario
    for chr in message{
        // verifica se é um espaço ou nao
        // procura a primeira chave a que o valor corresponde
        resultValue +=  (chr == " ") ? String(chr) : dictionary.filter{$0.value == String(chr)}.keys.first!
    }
    // retorna o resultado
    return resultValue
}

// imprime o resultado da mensage codificada
print(encodeMsg("hello world", code))
print(decodeMsg("uijt nfttbhf jt ibse up sfbe", code))

// ---------------------------- 3 -----------------------------
// 3. You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. 
// Create an array of strings called firstNames that contains only the values for “firstName” from each dictionary.

var people: [[String:String]] = [["firstName": "Calvin", "lastName": "Newton"], 
                                ["firstName": "Garry", "lastName": "Mckenzie" ],
                                ["firstName": "Leah", "lastName": "Rivera"],
                                ["firstName": "Sonja", "lastName": "Moreno"],
                                ["firstName": "Noel", "lastName": "Bowen"]]

// utilizando o map, recebe o valor correspondente á chave do elemento
var firstNames = people.map{$0["firstName"]!}
// imprime os resultados
print(firstNames)

// ---------------------------- 4 --------------------------------
// 4. You are given an array of dictionaries. Each dictionary in the array describes the score of a person. 
// Find the person with the best score and print his full name.

var people: [[String:Any]] = [["firstName": "Calvin", "lastName": "Newton","score": 13],
                            ["firstName": "Garry", "lastName": "Mckenzie", "score": 23],
                            ["firstName": "Leah", "lastName": "Rivera", "score": 10],
                            ["firstName": "Sonja", "lastName": "Moreno", "score": 3],
                            ["firstName": "Noel", "lastName": "Bowen", "score": 16]]
// ordena o array de pessoas descendente pelo score
var scoreorded = people.sorted(by: {($0["score"] as! Int) > ($1["score"] as! Int)})
// imprime o nome do melhor colocado
print(scoreorded[0]["firstName"]!)


// ----------------------------- 5 ----------------------------------
// 5. You are given an array of integers. Find out the frequency of each one.
// The frequency of a number is the number of times it appears in the array.
// Print the numbers in ascending order followed by their frequency.

var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]

// funcao que determina a frequencia de um numero
func frequency(_ list: [Int]) ->[Int : Int]{
    // inicia o dicionario de saida
    var resultValue = [Int : Int]()
    for value in list{
        // verifica se o valor existe no dicionario
        if(resultValue[value] != nil){
            // incrementa a quantidade
            resultValue[value]! += 1
        }
        // caso nao exista adiciona
        else{resultValue[value] = 1}
    }
    // retorna o resultado
    return resultValue
}
// imprime o resultado
print(frequency(numbers))

// ------------------------------- 6 ----------------------
// 6. Given an array of strings write a filter function that selects only strings that can be converted to Ints
let array : [String] = ["123123","123", "asdas12312"]

// funçao retorna um array com os numeros presentes em cada elemento
func GetIntIn(_ numberArray: [String]) -> [Int]{
    // guarda valores que podem ser transformados em inteiros
    var validNumbers = numberArray.filter{Int($0) != nil} 
    // retorna valores sendo eles inteiros
    return validNumbers.map{Int($0)!}
}
// imprime os numeros que sao retornados pela funcao
print(GetIntIn(array))