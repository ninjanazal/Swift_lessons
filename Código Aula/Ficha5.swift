import Foundation

// 1. You are given a dictionary code of type [String:String] which has values for all lowercase letters. 
// The code dictionary represents a way to encode a message. 
// For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz". 
// You are also given a message which contains only lowercase letters and spaces. 
// Use the code dictionary to encode the message and print it.

var code = [
    "a" : "b", "b" : "c", "c" : "d", "d" : "e", "e" : "f", "f" : "g", "g" : "h", "h" : "i", "i" : "j", "j" : "k",
    "k" : "l", "l" : "m", "m" : "n", "n" : "o", "o" : "p", "p" : "q", "q" : "r", "r" : "s", "s" : "t", "t" : "u",
    "u" : "v", "v" : "w", "w" : "x", "x" : "y", "y" : "z", "z" : "a"]

func invert(_ dict : [String:String]) -> [String:String] {
    var decoder : [String:String] = [:]
    for (key,value) in code {
        decoder[value] = key
    }
    return decoder
}

func transform (_ msg : String, _ dict : [String:String]) -> String {
    var encoded = ""
    for char in msg {
        let encodedChar = dict[String(char)]
        encoded += encodedChar == nil ? String(char) : String(encodedChar!)
    }
    return encoded
}

var message = "hello world"
var encoded = transform(message,code)
print(encoded)

// 2. Given an encoded message which contains only lowercase letters and spaces, use the code dictionary to decode the message and print it.

var encodedMessage = "uijt nfttbhf jt ibse up sfbe" // decoded should be "this message is hard to read"


var dictInverted = invert(code)
var decoded = transform(encodedMessage, dictInverted)
print(decoded)

// 3. You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. 
// Create an array of strings called firstNames that contains only the values for “firstName” from each dictionary.
var people: [[String:String]] = [
    [ "firstName": "Calvin", "lastName": "Newton"],
    [ "firstName": "Garry",  "lastName": "Mckenzie"], 
	[ "firstName": "Leah",   "lastName": "Rivera"],
    [ "firstName": "Sonja",  "lastName": "Moreno"],
    [ "firstName": "Noel",   "lastName": "Bowen"]]


// 4. You are given an array of dictionaries. Each dictionary in the array describes the score of a person. 
// Find the person with the best score and print his full name.
var scoredPeople: [[String:Any]] = [
    ["firstName": "Calvin", "lastName": "Newton", "score": 13],
    ["firstName": "Garry", "lastName": "Mckenzie", "score": 23],
    ["firstName": "Leah", "lastName": "Rivera", "score": 10],
    ["firstName": "Sonja", "lastName": "Moreno", "score": 3],
    ["firstName": "Noel", "lastName": "Bowen", "score": 16]
]
func collectBestScore(_ names : [[String:Any]]) -> [String:Any] {
    var maxPerson : [String:Any] = names[0]
    var maxScore = maxPerson["score"] as! Int
    
    for person in names { 
        if let score = person["score"] as? Int {
            if score > maxScore {
                maxScore = score
                maxPerson = person
            }
        }
    }
    return maxPerson
}

var best = collectBestScore(scoredPeople)
print("\(best["firstName"]!) \(best["lastName"]!) : \(best["score"]!)")

// 5. You are given an array of integers. Find out the frequency of each one.
// The frequency of a number is the number of times it appears in the array.
// Print the numbers in ascending order followed by their frequency.

var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]

func frequency(_ list : [Int]) -> [Int : Int]{
    var freq : [Int : Int] = [:]

    for val in list{
        if let valExists = freq[val] {
            freq[val] = valExists + 1
        }
        else{freq[val] = 1  }           
    }

    return freq
}

print(frequency(numbers))

