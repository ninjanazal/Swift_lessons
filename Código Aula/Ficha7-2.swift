import Foundation
// ficha 7

// 2- Add an extension to String type that returns a string with the vowels present in the 
// given string. Example:
// print("Hi team!".vowels()) "iea"
// cria uma extensao á string
extension String{
    // com o nome de Vowels , retornando uma string
    func Vowels() -> String{
        return self.filter{"aeiouAEIOU".contains($0)}   // filtro da string para caracteres contidos
    }
}

// print
print("HI team".Vowels())