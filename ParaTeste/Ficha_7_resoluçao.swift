/* 
Assume that you want to develop a program to manage the users registered in a
website. Each user has the following attributes: nickname, email, password, date of
registration, and last login.

-> Define the class User with the relevant attributes and 2 constructors: one that
initializes the attributes with a default value and another one that requires the
nickname, email and password.
Create also the Site class that allows you to dene a name together with the list
of registered users in the website.

-> Add a method to Site class that allows you to retrieve all the users with email
from "gmail.com"domain.
func UsersFromGmail() 􀀀 > [User] f ... g

-> Given an array of Users write a map function that returns an array of strings
consisting of the user's nicknames.

-> Add an extension to Date class that allows you to retrieve the year of a given
date.

-> Using the extension dened in previous question, add a method to Site class that
allows you to search the users registered in a given year.
func SearchUsersPerYear(year : Int) -> [User] f...g
*/

// estrutura de data, mes, dia, hora, minuto
struct CustomTime {
    // estrutura para guarda dados de tempo
    var year, month, day, hour,minute
}

// User class
class user{
    // variaveis internas da class
    var nickname, email, password
    CustomTime registationDate, lastLogin

    // var para extração da data
    private let date, calendar

    // construturo da class defaul
    init(){
        // inicializa com valores padrao
        nickname = ""
        email = ""
        password = ""
            
        // define a data
        date = Date()
        calendar  = Calendar.current
        // guarda valor do ano atual
        registationDate.year = calendar.component(.year, from: date)
        registationDate.month = calendar.component(.month, from: date)

    }
}