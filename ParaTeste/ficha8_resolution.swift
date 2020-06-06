import Foundation

// Ficha 8
// extensao ao array de strings
extension Array where Element == String{
    // retorna array de interiros com a quantidade de characteres por elemento
    func wordCharacterCount() -> [Int]{      
        // retorna resultados do map em que conta os elementos de cada string
        return self.map{$0.filter{!" ".contains($0)}}.map{$0.count}
    }
    // retorna a quantidade de caracteres total
    func totalCharacterCount() -> Int{
        // usando um map determina a quantidade de characteres em cada elemento
        // reduce para somar todos os elementos
        return self.map{$0.filter{!" ".contains($0)}}.map{$0.count}.reduce(0, +)
    }

    // retonra a quantidade de palavras
    func wordCount() -> Int{
        // para cada elemnto, divide em subStrings divididas pelo espaço
        // guarda para cada elemento a quantidade de palavras e reduz o array para o valor
        return self.map{$0.split(separator: " ").count}.reduce(0, +)
    }
}

// extensao ao array de Int
extension Array where Element == Int{
    // retorna o somatório de todos os elementos
    func sum() -> Int{
        // reduz o array para o valor do somatório
        return self.reduce(0, +)
    }
    // retorna o array correspondente sobe o formato de string
    public func string() -> [String]{
        // retorna o array de string usando um map
        return self.map{String($0)}
    }
}

// array de string de entrada
let arrayString : [String] = ["The Godfather", "The Shawshank Redemption" ,
"Schindler's List" , "Raging Bull" , "Gone with the Wind" , "The Wizard of Oz" ,
"Lawrence of Arabia" , " Forrest Gump"]

// array de inteiros de entrada
let numArray = [1,2,3,4,5,6]

// resultados
// 1-
print("Total Characters: \(arrayString.totalCharacterCount())")
print("Total words:  \(arrayString.wordCount())")
print("Chars per element: \(arrayString.wordCharacterCount())")

// 2- 
print(numArray.sum())
print(numArray.string())


// 3- 
// estrutura de pessoa
struct Person
{
var name:String
var age:Int
var salary:Double
}

// extensao ao array para este tipo
extension Array where Element == Person{
    // retorna um array de pessoas orientado pela idade
    func arrangePersonsByAge() -> [Person]{
        // utilizando ordenação de arrays , indica que o elemento anterior é maior que o seguinte
        return self.sorted(by: {$0.age < $1.age})
    }
    // retorna um array de pessoas orientado pelo salário
    func arrangePersonsBySalary() -> [Person]{
        // utilizando ordenaçao de arrays, indica quo o elemtno posterior
        // é maior que o anterior pela variavel
        return self.sorted(by: {$0.salary < $1.salary})
    }
}

let person1 = Person(name:"John" , age:40, salary: 932)
let person2 = Person(name:"David" , age:45, salary: 1876)
let person3 = Person(name:"Jim" , age:30, salary: 1763)
let person4 = Person(name:"Tom" , age:28, salary: 1527)
let person5 = Person(name:"Harry" , age:50, salary: 13344)

var personArray:[Person] = [person1,person2,person3,person4,person5]
//personArray.map{print("Person-Age :- \($0.age)")}
let reArrangedPersonByAge = personArray.arrangePersonsByAge()
//reArrangedPersonByAge.map{print("Person-Rearranged-Age :- \($0.age)")}
let reArrangedPersonBySalary = personArray.arrangePersonsBySalary()
reArrangedPersonBySalary.map{ print("Person-Rearranged-Salary :- \($0.salary)") }
