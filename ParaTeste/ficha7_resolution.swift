import Foundation

// Ficha 7
// extensao á date
extension Date{
    // retona o valor do ano da data definida
    func CurrentYear() -> Int{
        return Calendar.current.component(.year, from: self)
    }
}

// extensao á string
extension String{
    // retorna as vogais de uma determinada string
    func Vowels() -> String{
        return self.filter{"aeiouAEIOU".contains($0)}
    }
}

// user class
class User{
    private var name, email, password : String
    private var registationDate, lastLogin : Date

    // construturor da class
    // default
    init() {
        // inicia as variaveis com valores padrao 
        name        = String()
        email       = String()
        password    = String()
        registationDate = Date()
        lastLogin       = Date()
        
        //informa
        print("Default User Created") 
    }
    // construtor com valores de entrada
    init(userName : String, userEmail : String, userPassword : String) {
        // atribui os valores passador por parametro ás variaveis internas
        self.name       = userName
        self.email      = userEmail
        self.password   = userPassword
        registationDate = Date()
        lastLogin       = Date()
    }


     // geters
     // getter para o nome
     public func GetUserName() -> String{ return self.name }  
     // getter de email
     public func GetUserEmail() -> String{ return self.email }
     // getter para a data de registo
     public func GetUserRegistationDate() -> Date{ return self.registationDate}
}

// site class
class Site{
    private var siteName : String       // nome do site
    private var registedUsers : [User]  // lista de utilizadores registados

    // construtor do site
    init(siteName : String){
        // guarda o nome do site e inicia o array de utilizadores registados
        self.siteName = siteName
        self.registedUsers = [User]()

        // informa
        print("\(self.siteName) was created!")
    }

    // funçao que regista utilizadores
    public func RegistUser(_ newUser : User){
        // adiciona o utilizador á lista
        self.registedUsers.append(newUser)
        // informa
        print("\(newUser.GetUserName()) added to the Site!")
    }

    // indica quantos utilizadores estao registados
    public func RegistedUserCount() -> Int { return self.registedUsers.count }

    // metodo que retorna todos os utilizador que tem email de dominio "gmail.com"
    public func UsersFromGmail() -> [User]{
        //utilizando um filtro, precorre todos os elementos e confirma se o email comtem
        return self.registedUsers.filter{$0.GetUserEmail().contains("gmail.com") }
    }
    // metodo que retorna os nicknames de todos os utilizadores
    public func GetAllNickNames() -> [String]{
        // inicia o array de saida
        return self.registedUsers.map{$0.GetUserName()}
    }
    // metodo de procura utilizadores por ano de registo~
    public func SearchUsersPerYear(year: Int) -> [User]{
        // utilizando um filtro, precorre todos os elementos e confirma a data de inscriçao
        return self.registedUsers.filter{$0.GetUserRegistationDate().CurrentYear() == year}
    }
}

// ---------------------------- 
// verifica o ano actual
var myDate = Date()
//print("Current Year: \(myDate.CurrentYear())\n")

// cria um site
var mySite = Site(siteName : "mysite.com")

// cria um utilizador padrao
mySite.RegistUser(User(userName : "Eurico", userEmail : "eurico@gmail.com", userPassword : "12345"))
mySite.RegistUser(User(userName : "Eurico2", userEmail : "eurico@emaill.com", userPassword : "asdas"))
mySite.RegistUser(User(userName : "NotMe", userEmail : "mymail@gmail.com", userPassword : "435asdf"))
mySite.RegistUser(User(userName : "NotMe2", userEmail : "asdo@emaill.com", userPassword : "as123as"))

// indica quantos utilizadores estao registados
//print("\n--->>> Registed Users: \( mySite.RegistedUserCount())")
//print("-->> Gmail Users: \(mySite.UsersFromGmail().count)")
//print("-- \(mySite.GetAllNickNames())")
//print("-->> Registed Users in 1900: \(mySite.SearchUsersPerYear(year : 1900).count)")
//print("-->> Registed Users in 2020: \(mySite.SearchUsersPerYear(year : 2020).count)")

let getVowelString = "This a vowel test"
print(getVowelString.Vowels())


