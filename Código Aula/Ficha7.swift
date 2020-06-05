import Foundation
// ficha 7

class User : CustomStringConvertible {
    var nickname, email, password : String
    var dateRegistration: Date
    var lastLogin : Date?

	var description : String { return "Nick: \(nickname), Email: \(email)" }
	
    init(nickname : String, email: String, password: String)
    {
        self.nickname = nickname
        self.email = email
        self.password = password
        self.dateRegistration = Date()
    }
	
	init() {
		self.nickname = String()
		self.email = String()
		self.password = String()
		self.dateRegistration = Date()
	}
}

extension Date{
    func Year() -> Int{
        let calendar = Calendar.current
        let hour = calendar.component(.year, from : self)
        return hour
    }
}

class Site {
    var Users : [User]
    var name : String

    init(name : String)
    {
        self.name = name
        self.Users = []
    }
	
	func UsersFromGmail() -> [User] {
        return self.Users.filter { $0.email.contains("gmail.com") }
    }
	
	func Nicknames() -> [String] {
		return self.Users.map { $0.nickname }
	}

    func SearchUsersPerYear(year: Int) -> [User]{
        return Users.filter{$0.dateRegistration.Year() == year}
    }
}

var user1 = User(nickname: "dcc", email: "danieladacruz@gmail.com", password: "123")
var user2 = User(nickname: "outro", email: "asdasdas@gmail.com", password: "123123")
var site = Site(name: "mySite")
site.Users.append(user1)
site.Users.append(user2)
var gmailUsers = site.UsersFromGmail()
print(gmailUsers)



var t = Date()
print(t.Year())

print(site.SearchUsersPerYear(year: 2020))