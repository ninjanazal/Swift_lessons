// 13. Create an array that contains "a", "b", "c", called "myArray"
var my_array:  [String] = ["a","b","c"]

// 14. Get the length of myArray
print(my_array.count)   // imprime o numero de elemntos de um array

// 15. Get the 2nd item in myArray
print(my_array[2])  // imprime o elemento na primeira posiçao

my_array.append("d");
my_array.insert("letras", at : 0)
print(my_array)

// 16. Print "long" if the length of myArray is more than 5, else print "short"

if my_array.count >= 5 {print("long")}
else {print("short")}

// 17. Print each element in the array on a line by itself
var i = 0;
while i<my_array.count {
    print(my_array[i])
	i+=1
}
// ou entao (tipo forEach)
for e in my_array{
    print(e)
}

// 18. Create a constant array called "myStrings" that contains the strings: "these" "are" "my" "strings"
let my_strings = ["these", "are", "my","strings"]

// 19. Try to add the string "constant?" to to "myStrings", what happens?
// my_strings.append("constant") -> sendo uma var defenida com let(constante) nao pode ser alterada
// em runTime

// 20. Try to change "myStrings" to the value ["hey"], what happens?
// my_strings = ["hey"] -> da mesma forma que na linha anterior, uma variavel declarada como
// let (constante) nao pode ser alterada

// 21. Print the index of "my" in myStrings, if it is in the array
let index = my_strings.firstIndex(of: "my") // recolhe o indice da string correspondente a "my"
if(index != nil) { print("index: \(index!)")}   // caso exista, imprime o valor do indice
else{print("Index not found!")} // caso nao encontre, imprime 

// ou ainda
if let _ = my_strings.firstIndex(of: "my")
{print("found")}
else{print("not found")}

// 22. Print "success" if the following variable is not nil

// 23. Remove the "default" clause from this switch statement. What happens?
// um switch case tem de ser exaustivo, nao pode deixar sem executar um case

 let number = 42
switch number {
case 365, 366: // para executar o case para varios valores
    print("Days in year")
case 1024:
    print("Bytes in a Kilobyte")
case 0:
    print("Where arrays start")
case 42:
    print("The answer to life, the universe and everything")
default:    // obrigatoriamente tem de ser implementado, (swift exaustivo)
    print("Some uninteresting number")
} 
// tipo duplo
let point  = (1,2)
// switch para o pontp
switch point{
case(0,0):
    print("origem")
case(-2...2,0...2): // avalidado um intrevalo, em ambos os valores
    print("perto da origem")
default:
    print("outro valor")

}
